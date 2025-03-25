class UsersController < ApplicationController
    def index
            @product_category_ids = SellerProductCategory.all.distinct.pluck(:product_category_id)
            
            @sellerCategory = []
            @product_category_ids.each do |category|
               @sellerCategory.push(ProductCategory.find(category))
          end 
    end

    def show 
        if current_user.present?
          @user = User.find(current_user.id)
        end
    end

    def logOut
        reset_session
        redirect_to home_path
    end

end
