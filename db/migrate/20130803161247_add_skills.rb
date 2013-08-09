class AddSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
    end

    create_table :jobskills do |t|
      t.integer :skill_id
      t.integer :job_id
    end
  end
end
