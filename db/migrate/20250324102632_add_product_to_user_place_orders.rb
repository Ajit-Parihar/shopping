class AddProductToUserPlaceOrders < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_placed_orders, :product, null: false, foreign_key: true
  end
end
