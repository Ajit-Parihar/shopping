module AdminPanel
  class ProductsController < ApplicationController
    def show
      @products = Product.where(product_category_id: params[:id])
      
    end

    def edit
      @product = Product.find(params[:id])  # Fetch product by ID
    end

    def update
      if @product.update(product_params)
        redirect_to admin_panel_all_category_products_path, notice: "Product updated successfully."
      else
        render :edit
      end
    end

    def delete
      
      @product = Product.find(params[:id])
  
      # Remove foreign key associations before deleting
      @product.update(product_category_id: nil, user_id: nil, seller_product_details_id: nil)
    
      if @product.destroy
        flash[:notice] = "Product was successfully deleted."
        redirect_to admin_panel_all_category_products_path  # Adjust this path as needed
      else
        flash[:alert] = "Failed to delete the product."
        redirect_to admin_panel_all_category_products_path  # Adjust this path as needed
      end
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:category, :product_name, :brand_name, :product_type, :price)
    end
  end
end
