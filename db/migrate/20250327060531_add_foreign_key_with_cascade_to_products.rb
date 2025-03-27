class AddForeignKeyWithCascadeToProducts < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :products, :seller_product_details

    # Then, re-add the foreign key with ON DELETE CASCADE
    add_foreign_key :products, :seller_product_details, column: :seller_product_details_id, on_delete: :cascade
  end
end
