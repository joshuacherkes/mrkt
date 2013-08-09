class AddEmployerSeenProfile < ActiveRecord::Migration
  def change
  	create_table :employerseenprofiles do |t|
  		t.integer :profile_id 
  		t.integer :employer_id
  		t.boolean :isliked


  		t.timestamps
  	end
  end
end
