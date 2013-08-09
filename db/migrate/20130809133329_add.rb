class Add < ActiveRecord::Migration
  def change
  	create_table :userseenjobs do |t|
  		t.integer :user_id 
  		t.integer :job_id
  		t.boolean :isliked


  		t.timestamps
  	end
  end
end
