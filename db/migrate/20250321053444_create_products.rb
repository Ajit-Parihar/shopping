class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :category
      t.string :product_name
      t.string :brand_name
      t.string :type
      t.string :price

      t.timestamps
    end
  end
end
