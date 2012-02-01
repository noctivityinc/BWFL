class AddInvitesSentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invites_sent, :integer

  end
end
