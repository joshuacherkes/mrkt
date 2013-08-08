class AddTagline < ActiveRecord::Migration
  def change
  	add_column :profiles, :tagline, :string
  end
end
