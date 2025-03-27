class PlacedOrdersController < ApplicationController
  
  def orderplaced
    
    quantity = params[:quantity].to_i
    method = params[:method].to_i
    puts quantity.inspect
    @sellerProductDetail = current_product.seller_product_details_id
    @productDetail = SellerProductDetail.find(@sellerProductDetail)
    @productDetail.update(productCount: @productDetail.productCount-quantity)
    payBy = ""
    method == 1 ? payBy = "cod" : payBy = "online"
     isPersent=UserPlacedOrder.find_by(product_id: current_product.id)
 
     unless isPersent.present?
       @userPlacedOrder = UserPlacedOrder.create(paimentMethod: payBy, pending: true, product_id: current_product.id, user_id: current_user.id, start_time: Time.current)
     end
     puts @userPlacedOrder.inspect
   end

end