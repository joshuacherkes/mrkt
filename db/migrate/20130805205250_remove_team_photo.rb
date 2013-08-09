class RemoveTeamPhoto < ActiveRecord::Migration
  def change
    remove_column :jobs, :team_photo
  end
end
