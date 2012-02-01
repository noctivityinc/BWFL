# == Schema Information
#
# Table name: framey_videos
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  user_id              :integer
#  filesize             :integer         default(0)
#  duration             :float
#  state                :string(255)
#  views                :integer
#  data                 :string(255)
#  flv_url              :string(255)
#  mp4_url              :string(255)
#  medium_thumbnail_url :string(255)
#  large_thumbnail_url  :string(255)
#  small_thumbnail_url  :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  downloaded           :boolean         default(FALSE)
#

class Video < ActiveRecord::Base
  self.table_name = "framey_videos"
  paginates_per 20

  scope :downloaded , lambda { where("downloaded = ?", true) }
  scope :not_downloaded, lambda { where("downloaded = ?", false) }
  scope :not_private, joins(:user).where('"users"."private_video" = ?', false)

  belongs_to :user
end
