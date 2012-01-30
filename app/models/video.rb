class Video < ActiveRecord::Base
  self.table_name = "framey_videos"

  scope :downloaded , lambda { where("downloaded = ?", true) }
  scope :not_downloaded , lambda { where("downloaded = ?", false) }

  belongs_to :user
end
