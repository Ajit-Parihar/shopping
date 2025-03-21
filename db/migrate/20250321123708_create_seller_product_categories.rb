class CreateSellerProductCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :seller_product_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
