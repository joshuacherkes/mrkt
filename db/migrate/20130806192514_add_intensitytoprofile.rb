class AddIntensitytoprofile < ActiveRecord::Migration
  def change
    add_column :profileskills, :intensity, :integer 
  end
end
