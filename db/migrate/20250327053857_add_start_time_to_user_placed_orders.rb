class AddStartTimeToUserPlacedOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :user_placed_orders, :start_time, :datetime
  end
end
