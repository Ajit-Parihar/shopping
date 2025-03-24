class AddFieldsToUserPlacedOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :user_placed_orders, :paimentMethod, :string
    add_column :user_placed_orders, :deliver, :boolean
    add_column :user_placed_orders, :cancel, :boolean
    add_column :user_placed_orders, :pending, :boolean
  end
end
