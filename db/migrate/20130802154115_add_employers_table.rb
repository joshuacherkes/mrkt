class AddEmployersTable < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :email, :null => false, :unique => true
      t.string :company, :null => false
    end
  end
end
