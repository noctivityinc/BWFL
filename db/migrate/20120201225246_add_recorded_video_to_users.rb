class AddRecordedVideoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recorded_video, :boolean, :default => false 
  end
end
