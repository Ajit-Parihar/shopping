class ConformOrdersController < ApplicationController

  

  def index
    @quantity = params[:quantity].to_i  
    @quantity = @quantity + 1 


     @sellerProductDetail = current_product.seller_product_details_id
     
      @placedOrder = ConformOrder.where(user_id: current_user.id)
      @count = 0
      if @placedOrder.present?

      @placedOrder.each do |order|
          @placedOrderStatus = UserPlacedOrder.find(order.user_placed_order_id)
       
          if @placedOrderStatus.paimentMethod.to_s == "Cash on Delivery" && @placedOrderStatus.cancel == true          
                  @count+=1
          end
        end
    end

    if @count > 5
      flash[:notice] = "cod not available current Account"
    end
  end

   
end
