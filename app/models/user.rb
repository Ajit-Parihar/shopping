class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :timeoutable

  has_many :products

  has_many :seller_product_categories
  has_many :product_categories, through: :seller_product_categories
  has_one :user_details

   def timeout_in
      1.minutes
   end

end
