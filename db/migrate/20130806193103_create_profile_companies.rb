class CreateProfileCompanies < ActiveRecord::Migration
  def change
    create_table :profile_companies do |t|
      t.integer :profile_id
      t.integer :company_id

      t.timestamps
    end
  end
end
