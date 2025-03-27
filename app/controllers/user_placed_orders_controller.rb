class UserPlacedOrdersController < ApplicationController
    def index

        @userPlacedOrders = UserPlacedOrder.where(user_id: current_user.id)
        puts "2222222"
        puts @userPlacedOrder.inspect
  
    end
end