class SellerProductDetail < ApplicationRecord
  # belongs_to :product
  has_one :products, dependent: :nullify
end
