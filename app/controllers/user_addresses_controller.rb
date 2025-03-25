class UserAddressesController < ApplicationController
  def index
  end

  def new
    @user_address = UserAddress.new
  end

  def create
     @user_address = UserAddress.new(params_address)
     @user_detail = UserDetail.find_by(user_id: current_user.id)

     @user_address.user_detail_id = @user_detail.id
     puts "2222222222222222"
     @user_address.valid?
      puts @user_address.errors.full_messages
     if @user_address.save
      @product = Product.find_by(id: current_product)
         redirect_to buy_product_index_id_path(@product)
     end
  end
  private

  def params_address
      params.require(:user_address).permit(:country, :state, :dist, :block, :town, :gali_no, :house_no) 
  end

end
