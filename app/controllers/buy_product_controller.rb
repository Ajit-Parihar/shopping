class BuyProductController < ApplicationController
  before_action :authenticate_user!
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
     @seller_product_details = SellerProductDetail.find(current_product.seller_product_details_id)
     @product_count = @seller_product_details.productCount    
    end

    def addTocart

        @product_id = params[:id]

      
        @product = Product.find_by(id: @product_id)
      

        @addToCart = AddToCart.find_or_create_by(user: current_user, product: @product)
      

        @userAddToCard = AddToCart.where(user:current_user)
      
        puts "🔍 Checking @userAddtoCard:111111111111111111111"
        puts @userAddToCard.inspect
         @addToCardProduct = []
         @userAddToCard.each do |user|
             @addToCardProduct.push(Product.find(user.product_id))
         end  
            puts "############"
         puts @addToCardProduct.inspect

           
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
end