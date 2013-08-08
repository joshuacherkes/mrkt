class AddIntensitytoProfileCompanies < ActiveRecord::Migration
  def change
  	  	add_column :profile_companies, :intensity, :integer
  end
end
