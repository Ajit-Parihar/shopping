class UserDetailController < ApplicationController
  def index
  end

  def new
    puts "working"
    @userDetail = UserDetail.find_by(user_id: current_user.id)
    @paimentMethod = params[:id]
    puts @userDetail.inspect
    
     if @userDetail.present?
       puts "all okey"
       puts "2222222222222222"
            # redirect_to conform_order_placed_path 
             redirect_to final_placed_order_path
      return
     end
    #  @userDetail = UserDetail.new
  end
 
end
