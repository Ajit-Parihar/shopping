class SellerProductDetail < ApplicationRecord
  # belongs_to :product
  # has_one :products, dependent: :nullify
  has_one :products, dependent: :destroy
end
