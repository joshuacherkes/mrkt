class ProfilesController < ApplicationController 
  include ApplicationHelper
  def new
  end

  def create
    @user = current_user
    @profile = Profile.new(params[:profile])
    @profile.user_id = @user.id

    #add fancy stuff like companies and skills
    if @profile.save
      #Creating Skills and Skill Attributes
      params[:skills_attributes].values.each_with_index do |skill, index|
        next if skill["title"].blank?
        made_skill = Skill.create!(skill)
        Profileskill.create!({profile_id: @profile.id, 
          skill_id: made_skill.id, 
          intensity: params[:profileskills_attributes]["#{index}"][:intensity]})
      end
      #Creating Companies and Company Attributes
      params[:companies_attributes].values.each_with_index do |company, index|
        next if company[:name].blank?
        made_company = Company.create!(company)
        ProfileCompany.create!({profile_id: @profile.id, 
          company_id: made_company.id, 
          intensity: params[:profilescompanies_attributes]["#{index}"][:intensity]})
      end
      redirect_to dashboard_user_url
    else
      render :nothing => true, :status => 422
    end
  end

  def show
    @profile = Profile.includes(:profileskills).find(params[:id])
    @profileskills = @profile.profileskills.includes(:skill)
    @profilecompanies = @profile.profile_companies
    render :show
  end


  def edit
    @profile = Profile.find(params[:id])
    @skills = @profile.skills
    @companies = @profile.companies
  end

  def update
    @user = current_user
    @profile = Profile.find(params[:id])
    @profile.user_id = @user.id

    if params[:profile][:skill_ids]
      params[:profile][:skill_ids].each do |skill_id|
        to_destroy = Profileskill.where(:skill_id => skill_id, :profile_id => @profile.id)
        to_destroy.destroy_all
        Skill.find(skill_id).destroy
      end
    end
    if params[:profile][:company_ids]
      params[:profile][:company_ids].each do |company_id|
        to_destroy = ProfileCompany.where(:company_id => company_id, :profile_id => @profile.id)
        to_destroy.destroy_all
        Company.find(company_id).destroy
      end
    end

    #create new skills should DRY this up at some point (duplicate code with #create)
      params[:skills_attributes].values.each_with_index do |skill, index|
        next if skill[:title].blank?
        made_skill = Skill.create!(skill)
        Profileskill.create!({profile_id: @profile.id, 
          skill_id: made_skill.id, 
          intensity: params[:profileskills_attributes]["#{index}"][:intensity]})
      end

      #Creating Companies and Company Attributes
      params[:companies_attributes].values.each_with_index do |company, index|
        next if company[:name].blank?
        made_company = Company.create!(company)
        ProfileCompany.create!({profile_id: @profile.id, 
          company_id: made_company.id, 
          intensity: params[:profilescompanies_attributes]["#{index}"][:intensity]})
      end

      @profile.description = params[:profile][:description]
      @profile.name = params[:profile][:description]
      if @profile.save
        redirect_to dashboard_user_url
      end
  end

  def destroy
  end

  def like
    @profile = Profile.find(params[:id])
    @employer = current_employer
    @employerseenprofile = Employerseenprofile.new({employer_id: @employer.id, profile_id: @profile.id, isliked: true})
    if @employerseenprofile.save
      redirect_to match_employer_url
    else
      render :nothing => true, :status => 500
    end
  end

  def dislike
    @profile = Profile.find(params[:id])
    @employer = current_employer   
    @employerseenprofile = Employerseenprofile.new({employer_id: @employer.id, profile_id: @profile.id, isliked: false})
    if @employerseenprofile.save
      redirect_to match_employer_url
    else
      render :nothing => true, :status => 500
    end
  end
end