class CreateAddToCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :add_to_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
