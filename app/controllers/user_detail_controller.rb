class UserDetailController < ApplicationController
  def index
  end

  def new
    @userDetail = UserDetail.find_by(user_id: current_user.id)
  
    puts @userDetail.inspect
    
     if @userDetail.present?
   
        redirect_to order_placed_path
        return
     end

    @userDetail = UserDetail.new
  end
end
