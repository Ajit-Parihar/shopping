module AdminPanel
  class AdminsController < ApplicationController

    before_action :authenticate_user!
    before_action :authorize_admin!     

  private
    def authorize_admin!
      unless current_user.role == "admin"
        
        redirect_to home_path, alert: "Access denied!" 
      end
      end

public
    def index
      @product_category_ids = SellerProductCategory.all.distinct.pluck(:product_category_id)
             
          @sellerCategory = []
           @product_category_ids.each do |category|
           @sellerCategory.push(ProductCategory.find(category))
        end 
    end
    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        redirect_to admin_panel_admins_path, notice: "Admin created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    # def products 
      
    # end

    private

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end


end
