class CreateSellerProductDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :seller_product_details do |t|
      t.integer :productCount
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
