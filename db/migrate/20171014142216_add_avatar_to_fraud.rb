class AddAvatarToFraud < ActiveRecord::Migration
  def change
    add_column :frauds, :avatar, :string
  end
end
