class ConformOrdersController < ApplicationController
  def index
      @placedOrder = ConformOrder.where(user_id: current_user.id)
      @count = 0
      if @placedOrder.present?
       
      @placedOrder.each do |order|
          @placedOrderStatus = UserPlacedOrder.find(order.user_placed_order_id)
       
          if @placedOrderStatus.paimentMethod.to_s == "Cash on Delivery" && @placedOrderStatus.cancel == true          
                  @count+=1
          end
    
          if @count > 5
             puts "cod is not available"
          end
        end
    end

      puts @count
        #  @placedOrderStatus = UserPlacedOrder.find(@placedOrder.user_placed_order_id)
        #  puts @placedOrderStatus.inspect
        # redirect_to user_detail_new_path
  end

   def orderplaced
       @userDetail = UserDetail.find_by(user_id: current_user)
   end
   def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order placed successfully!"
      render "order_placed_path" 
    else
      render :new
    end
  end
  
end
