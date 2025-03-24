class AddUserPlacedOrderToConformOrders < ActiveRecord::Migration[7.2]
  def change
    add_reference :conform_orders, :user_placed_order, null: false, foreign_key: true
  end
end
