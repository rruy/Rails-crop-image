class AddAttachmentAvatarToFrauds < ActiveRecord::Migration
  def self.up
    change_table :frauds do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :frauds, :avatar
  end
end
