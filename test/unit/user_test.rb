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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert User.new.valid?
  end
end
