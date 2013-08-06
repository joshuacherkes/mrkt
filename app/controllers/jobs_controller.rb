class JobsController < ApplicationController 
	before_filter :authenticate_employer!
	include ApplicationHelper
	def new
		@job = Job.new
		@skills = Skill.all
		render :new
	end

	def create
		@employer = current_employer
		@job = Job.new(params[:job])
		@job.employer_id = @employer.id
		@job.team_photo = URI.parse(@job.filepicker_url + "+name.jpeg")
		if @job.save
			redirect_to jobs_url
		else

		    flash.notice = "Submission failed. Please fix the errors below."
		    render "Submission failed. Please fix the errors below."
		end
	end

	def index
		@jobs = current_employer.jobs
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
		@job = Job.includes(:jobskills).find(params[:id])
		@jobskills = @job.jobskills
		render :show
	end

	def edit
		@job = Job.find(params[:id])
		@skills = @job.skills
	end
end

