class JobsController < ApplicationController 
	before_filter :authenticate_employer!
	include ApplicationHelper
	def new
		@skills = Skill.all
		render :new
	end

	def create
		@employer = current_employer
		@job = Job.new(params[:job])
		@job.employer_id = @employer.id
		if @job.save
			render :index
		else
			render :nothing => true, :status => 500
		end
	end

	def index
		@jobs = current_employer.jobs
	end

	def destroy
	end

	def update
	end


end