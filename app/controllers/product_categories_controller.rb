class ProductCategoriesController < ApplicationController
  def seller_category
    @product_category_ids = SellerProductCategory.where(user_id: current_user.id).distinct.pluck(:product_category_id)
    
    @sellerCategory = []
    @product_category_ids.each do |category|
       @sellerCategory.push(ProductCategory.find(category))
    end
  end

  def all_category_products
    # @products = Product.where(product_category_id: params[:id] , user_id: current_user.id)
    #   puts @product.inspect

        @products = Product.where(product_category_id: params[:id], user_id: current_user.id)
                           .page(params[:page]) 
                           .per(1) 
      
  end

  def all_complete_products
    @products = Product.where(product_category_id: params[:id])
  end


  def edit
      @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # redirect_to seller_product_details_edit_path(@product)
      redirect_to category_product_path(@product.product_category_id), notice: "Product updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    puts "working fine"
    product = Product.find(params[:id])
    product_id = product.product_category_id
    product.destroy
      
    redirect_to category_product_path(product_id), notice: "Product deleted successfully!"
  end

  private

  def product_params
    params.require(:product).permit(:category, :product_name, :brand_name, :product_type, :price)
  end
end
