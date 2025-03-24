Rails.application.routes.draw do
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
    resources :product_categories
    resources :products
    resources :seller_product_details
    get "home", to: "users#index", as: "home"
    get "seller", to: "seller_info#index",as: "seller_home"
    get "all/category/product/:id", to: "product_categories#all_category_products", as: "category_product"
    get "all/complete/product/:id", to: "product_categories#all_complete_products", as: "complete_product"
    resources :buy_product
    get "buy_product/index/:id", to: "buy_product#index", as: "buy_product_index_id"
    resources :user_detail
    resources :user_addresses
    resources :conform_orders
    get "order/placed", to: "conform_orders#orderplaced", as: "order_placed"
end
