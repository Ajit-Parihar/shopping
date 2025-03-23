class Product < ApplicationRecord

  belongs_to :user
  belongs_to :product_category
  has_one_attached :image
  belongs_to :seller_product_detail, optional: true

end
