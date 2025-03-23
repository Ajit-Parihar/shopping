class UserDetail < ApplicationRecord
  belongs_to :user
  has_many :user_addresses
end
