class AddJobsTable < ActiveRecord::Migration
  def change
  	create_table :jobs do |t|
	  	t.integer :employer_id
	  	t.string :team_name
	  	t.text :description
	  	t.string :team_photo
	end
  end
end
