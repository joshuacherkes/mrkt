class JobsController < ApplicationController
  before_filter :authenticate_employer!, :except => [:like, :dislike]
  before_filter :authenticate_user!, :only => [:like, :dislike]

  include ApplicationHelper

  def new
    if current_employer.jobs.length > 0
      render :new
    else
      render :first
    end
  end

  def create
    @employer = current_employer
    @job = Job.new(params[:job])
    @job.employer_id = @employer.id
    if @job.filepicker_url != ""
      @job.team_photo = URI.parse(@job.filepicker_url + "+name.jpeg")
    end

    #create jobskills and save
    if @job.save
      params[:skills_attributes].values.each_with_index do |skill, index|
        made_skill = Skill.create!(skill)
        Jobskill.create!({job_id: @job.id, 
          skill_id: made_skill.id, 
          intensity: params[:jobskills_attributes]["#{index}"][:intensity]})
      end
      redirect_to dashboard_employer_url
    else

        flash.notice = "Submission failed. Please fix the errors below."
        render "Submission failed. Please fix the errors below."
    end
  end

  def index
    @jobs = current_employer.jobs
    render :index
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to jobs_url, :flash => { :success => "Listing Succesfully Deleted"}
    else
      render :nothing => true, :status => 500
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to jobs_url
    else
      render :nothing => true, :status => 500
    end

  end

  def show
    @job = Job.includes({:jobskills => :skill}, :employer).find(params[:id])
    @jobskills = @job.jobskills
    if @job.employer != current_employer
      not_found
    end
  end

  def edit
    @job = Job.includes(:skills).find(params[:id])
    @skills = @job.skills
  end

  def like
    @job = Job.find(params[:id])
    @user = current_user
    @userseenjob = Userseenjob.new({user_id: @user.id, job_id: @job.id, isliked: true})
    if @userseenjob.save
      redirect_to match_user_url
    else
      render :nothing => true, :status => 500
    end
  end

  def dislike
    @job = Job.find(params[:id])
    @user = current_user
    @userseenjob = Userseenjob.new({user_id: @user.id, job_id: @job.id, isliked: false})
    if @userseenjob.save
      redirect_to match_user_url
    else
      render :nothing => true, :status => 500
    end
  end





























end

