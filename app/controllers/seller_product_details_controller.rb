class SellerProductDetailsController < ApplicationController

   def new
    @productDetails = SellerProductDetail.new 
   end
   
   def create   
      puts params_productDetails[:productCount]
      @productDetails =  SellerProductDetail.create(productCount: params_productDetails[:productCount])
      puts @productDetails.inspect
      puts "333333333"
      @product_id = params_productDetails[:product_id]
      puts @product_id
      if @productDetails.save
         puts "all okey"
         puts @product_id.inspect
         @product = Product.find_by(id: @product_id)
         puts @product.inspect
         puts @productDetails.inspect
         @product.seller_product_details_id = @productDetails.id
         @product.save
       
         redirect_to seller_home_path, notice: "add product successfully"
      else 
         redirect_to new_seller_product_detail_path, notice: "some error occurs"
      end
   end 

   private
   
   def params_productDetails
      puts "4444444444444444444"
       params.require(:seller_product_detail).permit(:productCount, :product_id) 
   end
end
