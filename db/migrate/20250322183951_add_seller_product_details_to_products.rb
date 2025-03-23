class AddSellerProductDetailsToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :seller_product_details, null: true, foreign_key: true
  end
end
