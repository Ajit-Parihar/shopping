class UserDetail < ApplicationRecord
  belongs_to :user
  has_many :user_addresses
  validates :user_id, presence: true, allow_nil: true

end
