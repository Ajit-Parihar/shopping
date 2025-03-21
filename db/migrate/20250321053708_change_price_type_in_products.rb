class ChangePriceTypeInProducts < ActiveRecord::Migration[7.2]
  def up
    # Step 1: Add a new column with the correct type
    add_column :products, :price_new, :integer

    # Step 2: Copy and convert data safely
    Product.reset_column_information
    Product.find_each do |product|
      product.update_columns(price_new: product.price.to_i) if product.price.present?
    end

    # Step 3: Remove old column and rename new one
    remove_column :products, :price
    rename_column :products, :price_new, :price
  end
end
