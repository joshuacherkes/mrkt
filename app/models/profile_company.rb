class ProfileCompany < ActiveRecord::Base
  attr_accessible :company_id, :profile_id, :intensity

  belongs_to :company
  belongs_to :profile 
end
