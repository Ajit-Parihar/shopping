Rails.application.routes.draw do
  get "admins/index"
  get "admins/new"

 
  get "conform_orders/index"
  get "user_addresses/index"
  get "user_addresses/new"
  get "user_detail/index"
  get "user_detail/new"
  get "product_categories/seller_category"
  get "products/index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

    namespace :admin_panel do
      resources :admins, only: [:new, :create, :index] 
      resources :products, only: [:index, :edit, :update, :delete]
      resources :users, only: [:index, :edit, :delete]
       get "products/:id", to: "products#show", as: "all_category_products"
       post "product/update/:id", to: "products#update", as: "update_product"
       get "products/delete/:id", to: "products#delete", as: "delete_product"
       get "user/delete/:id", to: "users#delete", as: "delete_user"

    end
    
    resources :product_categories
    resources :products
    resources :seller_product_details
    get "home", to: "users#index", as: "home"
    get "seller", to: "seller_info#index",as: "seller_home"
    get "all/category/product/:id", to: "product_categories#all_category_products", as: "category_product"
    get "all/complete/product/:id", to: "product_categories#all_complete_products", as: "complete_product"
    resources :buy_product
    get "buy_product/index/:id", to: "buy_product#index", as: "buy_product_index_id"
    get "buy_product/addTocard/:id", to: "buy_product#addTocard", as: "buy_roduct_addTocard_id"
    resources :user_detail
    resources :user_addresses
    resources :conform_orders
    get "order/:id", to: "user_detail#new", as: "user_detail_new_id"
    get "order/placed", to: "conform_orders#orderplaced", as: "conform_order_placed"
    get "show/details", to: "users#show", as: "show_user_details"
    get "user/logOut", to: "users#logOut", as: "logOut_user"
end
