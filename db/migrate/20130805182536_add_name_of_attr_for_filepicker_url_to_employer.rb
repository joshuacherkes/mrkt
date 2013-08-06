class AddNameOfAttrForFilepickerUrlToEmployer < ActiveRecord::Migration
  def change
  	add_column :jobs, :filepicker_url, :string
  end
end
