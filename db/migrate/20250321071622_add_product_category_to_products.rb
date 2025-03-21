class AddProductCategoryToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :product_category, null: true, foreign_key: true
  end
end
