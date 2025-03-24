class CreateConformOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :conform_orders do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
