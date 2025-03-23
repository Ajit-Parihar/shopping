class AddUserDetailsToUserAddresses < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_addresses, :user_detail, null: false, foreign_key: true
  end
end
