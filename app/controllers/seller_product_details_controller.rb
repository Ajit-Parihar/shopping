class SellerProductDetailsController < ApplicationController

   def new
    @productDetails = SellerProductDetail.new 
   end
   
   def create   
      external_data = params[:external_data].to_i 
      puts external_data
      @productDetails =  SellerProductDetail.create(params_productDetails)
      puts "1111111111111"
      puts @productDetails.inspect
      puts @productId.inspect
      if @productDetails.save
         redirect_to products_path, notice: "add product successfully"
      else 
         redirect_to new_seller_product_detail_path, notice: "some error occurs"
      end
   end 

   private
   
   def params_productDetails
      puts "444444"
      product_params = params.require(:seller_product_detail).permit(:productCount) 
   end
end
