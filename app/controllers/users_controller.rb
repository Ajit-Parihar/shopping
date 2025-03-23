class UsersController < ApplicationController
    def index
            @product_category_ids = SellerProductCategory.all.distinct.pluck(:product_category_id)
            
            @sellerCategory = []
            @product_category_ids.each do |category|
               @sellerCategory.push(ProductCategory.find(category))
          end 
    end
end
