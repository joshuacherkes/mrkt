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
      redirect_to profile_url(@profile)
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
  end

  def destroy
  end
end