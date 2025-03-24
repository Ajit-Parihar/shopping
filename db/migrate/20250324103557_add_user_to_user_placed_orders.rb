class AddUserToUserPlacedOrders < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_placed_orders, :user, null: false, foreign_key: true
  end
end
