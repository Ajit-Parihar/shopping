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
        end
         
    end

    if @count > 5
      flash[:notice] = "cod not available current Account"
    end

      puts @count
        #  @placedOrderStatus = UserPlacedOrder.find(@placedOrder.user_placed_order_id)
        #  puts @placedOrderStatus.inspect
        # redirect_to user_detail_new_path
  end
  def order_placed
    # puts "000000"
    # @payment_method = params[:payment_method]
      
    #    puts "okey all good"
    #    puts @payment_method.inspect
   end
   
end
