class ProductCategoriesController < ApplicationController
  def seller_category
    @product_category_ids = SellerProductCategory.where(user_id: current_user.id).distinct.pluck(:product_category_id)
    
    @sellerCategory = []
    @product_category_ids.each do |category|
       @sellerCategory.push(ProductCategory.find(category))
    end
  end

  def all_category_products
    @products = Product.where(product_category_id: params[:id] , user_id: current_user.id)
      puts @product.inspect
  end

  def all_complete_products
    @products = Product.where(product_category_id: params[:id])
  end
end
