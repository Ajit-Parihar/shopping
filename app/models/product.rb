class Product < ApplicationRecord

  belongs_to :user
  belongs_to :product_category
  has_many :seller_product_details
  has_one_attached :image

end
