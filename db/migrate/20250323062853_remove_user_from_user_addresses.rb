class RemoveUserFromUserAddresses < ActiveRecord::Migration[7.2]
  def change
    remove_reference :user_addresses, :user, foreign_key: true
  end
end
