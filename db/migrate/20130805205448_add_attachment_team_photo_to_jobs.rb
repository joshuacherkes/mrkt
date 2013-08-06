class AddAttachmentTeamPhotoToJobs < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.attachment :team_photo
    end
  end

  def self.down
    drop_attached_file :jobs, :team_photo
  end
end
