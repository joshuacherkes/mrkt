class AddUserskills < ActiveRecord::Migration
  def change
    create_table :profileskills do |t|
      t.integer :profile_id
      t.integer :skill_id
    end 
  end
end
