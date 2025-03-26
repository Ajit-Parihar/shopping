class Product < ApplicationRecord

  belongs_to :user
  belongs_to :product_category
  has_one_attached :image
  belongs_to :seller_product_detail, optional: true

  has_many :user_placed_orders

  has_many :add_to_carts, dependent: :destroy
  has_many :users, through: :add_to_carts

end
