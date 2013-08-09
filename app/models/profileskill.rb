class Profileskill < ActiveRecord::Base
  attr_accessible :profile_id, :skill_id, :intensity 

  belongs_to :profile
  belongs_to :skill




end