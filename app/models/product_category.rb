class ProductCategory < ApplicationRecord
  has_many :products

  has_many :seller_product_categories
  has_many :users, through: :seller_product_categories
  

end
