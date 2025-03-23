class RemoveProductIdFromSellerProductDetails < ActiveRecord::Migration[7.2]
  def change
    remove_column :seller_product_details, :product_id, :integer
  end
end
