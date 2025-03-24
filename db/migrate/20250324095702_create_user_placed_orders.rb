class CreateUserPlacedOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :user_placed_orders do |t|
      t.timestamps
    end
  end
end
