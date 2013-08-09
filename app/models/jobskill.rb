class Jobskill < ActiveRecord::Base
  attr_accessible :intensity, :job_id, :skill_id 

  belongs_to :job
  belongs_to :skill



end