class AddDownloadedToVideos < ActiveRecord::Migration
  def change
  	add_column :framey_videos, :downloaded, :boolean, :default => false 
  end
end
