class AddIntensityToSkills < ActiveRecord::Migration
  def change
  	add_column :jobskills, :intensity, :integer
  end
end
