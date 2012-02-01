# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  email         :string(255)
#  approved      :boolean
#  message       :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  token         :string(255)
#  private_video :boolean         default(FALSE)
#  invites_sent  :integer
#

class User < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name, :email, :approved, :message, :private_video, :token, :recorded_video
  friendly_id :token


  validates_presence_of :name, :email
  validates :email, :email => true, :if => Proc.new {|record| !record.email.blank?}
  validates_uniqueness_of :email, :if => Proc.new {|record| record.new_record?}

  validates_presence_of :token
  validates_uniqueness_of :token

  has_many :videos, :dependent => :destroy 

  before_validation(:on => :create) do
    self.token = rand(36**8).to_s(36) if self.new_record? and self.token.nil?
  end

end
