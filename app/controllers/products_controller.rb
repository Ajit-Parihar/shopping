class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create_category(category)
    product_category = ProductCategory.create(category: category)
    return product_category if product_category.persisted?
  end
  
 
  def create_seller_product_category(category_id)
    seller_product_category = SellerProductCategory.create(user_id: current_user.id, product_category_id: category_id, role: current_user.role)
    return seller_product_category.persisted?
  end
  
  def create
    @product = Product.new(params_product)
    @product.user_id = current_user.id
  
    @category = @product.category
    @iscategory = ProductCategory.find_by(category: @category)
  
    if @iscategory.present?
      @product.product_category_id = @iscategory.id
    else
      new_category = create_category(@category)
      @product.product_category_id = new_category.id if new_category
    end
  
    if @product.save
      puts "1111111111111"
      success = create_seller_product_category(@product.product_category_id)
      
      if success
        redirect_to new_seller_product_detail_path(id: @product.id) and return
      else
        redirect_to new_product_path, notice: "Failed to create seller product category"
      end
    else
      redirect_to new_product_path, notice: "Try again, some error occurred"
    end
  end
  
  private

  def params_product
     params.require(:product).permit(:category, :product_name, :brand_name, :product_type, :price, :image)
  end
end
