class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create_category(category)
  
      @create = ProductCategory.create(category: @category)
      
      if @create.save
         return
      end
  end

  def create
     @product = Product.create(params_product)
     @product.user_id = current_user.id
  
     @category = @product.category
     @iscategory = ProductCategory.find_by(category: @category)
     puts @iscategory.inspect
     if @iscategory.present?
        @product.product_category_id = @iscategory.id
     else
       create_category(@category)
     end


     if @product.save

      redirect_to new_seller_product_detail_path
      # redirect_to products_path, notice: "product created!"
     else
      redirect_to new_product_path, notice: "Try again some error occurs"
     end
  end

  private

  def params_product
     params.require(:product).permit(:category, :product_name, :brand_name, :product_type, :price, :image)
  end
end
