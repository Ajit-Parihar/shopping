class UserAddress < ApplicationRecord
  belongs_to :user
  belongs_to :user_detail
end
