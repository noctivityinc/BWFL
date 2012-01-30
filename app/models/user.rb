class User < ActiveRecord::Base
  attr_accessible :name, :email, :approved, :message

  validates_presence_of :name, :email
  validates :email, :email => true, :if => Proc.new {|record| !record.email.blank?} 

  has_many :videos

end
