class AddMatches < ActiveRecord::Migration
  def change
  	create_table :matches do |t|
  		t.integer :user_id
  		t.integer :job_id
  		t.integer :employer_id

  		t.timestamps
  	end
  end
end
