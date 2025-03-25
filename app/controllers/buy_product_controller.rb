class BuyProductController < ApplicationController
    def index


      @product_id = params[:id]
      puts @product_id.inspect
      session[:product_id] = @product_id 
  
      
         @userDetail = UserDetail.find_by(user_id: current_user.id)
       
         puts @userDetail
         if @userDetail.present?
        
         @userAddress = UserAddress.find_by(user_detail_id: @userDetail.id)
       
          unless @userAddress.present?
              UserDetail.where(user_id: @userDetail.user_id).destroy_all           
          end
        end
        details = UserDetail.all
          unless details.present?
          
           userDetail = UserDetail.create(user_id: current_user.id)
           
           if userDetail.save
               redirect_to user_addresses_new_path
           end
          else
            
            user_detail = UserDetail.find_by(user_id: current_user.id)
            if user_detail
              puts user_detail.inspect
            else
              userDetail = UserDetail.create(user_id: current_user.id)
              redirect_to  user_addresses_new_path
            end
          end

    
          
         #  @product = Product.find(current_product.id)
           @product = Product.find_by(id: @product_id)
           puts @prouduct.inspect
   
     @user_details_id = UserDetail.find_by(user_id: current_user.id)
     @user_address = UserAddress.where(user_detail_id: @user_details_id)
     puts @user_address.inspect
    
    end

    def addTocard
      
    end
end