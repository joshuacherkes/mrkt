class Profile < ActiveRecord::Base
	attr_accessible :companies_attributes, :name, :tagline, :description

	belongs_to :user 
	has_many :profileskills
	has_many :profile_companies
	has_many :companies, :through => :profile_companies
	has_many :skills, :through => :profileskills

	accepts_nested_attributes_for :companies, :reject_if => :all_blank




end