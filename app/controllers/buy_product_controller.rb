class BuyProductController < ApplicationController
    def index
          details = UserDetail.all
          unless details.present?
           userDetail = UserDetail.create(user_id: current_user.id)
           if userDetail.save
            redirect_to  user_addresses_new_path
           end
          else
            puts "user details check"
            user_detail = UserDetail.find_by(user_id: current_user.id)
            if user_detail
              puts user_detail.inspect
            else
              userDetail = UserDetail.create(user_id: current_user.id)
              redirect_to  user_addresses_new_path
            end

          end
     @user_details_id = UserDetail.find_by(user_id: current_user)
     @user_address = UserAddress.where(user_detail_id: @user_details_id)
     puts @user_address.inspect
     @product_id = params[:id]
     puts @product_id.inspect
     session[:product_id] = @product_id 
     @product = Product.find(current_product.id)
      
    end
end
