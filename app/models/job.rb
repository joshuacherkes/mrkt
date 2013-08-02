class Job < ActiveRecord::Base

	validates :team_name, :description, :presence => true

	belongs_to :employer
	
end