class AddTokenToUserAndPrivateToVideos < ActiveRecord::Migration
  def self.up
  	add_column :users, :token, :string
  	add_column :users, :private_video, :boolean, :default => false
  end

  def self.down
  	remove_column :framey_videos, :private
  	remove_column :users, :token
  end
end
