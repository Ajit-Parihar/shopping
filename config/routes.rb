Rails.application.routes.draw do
  get "products/index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

    resources :products
    resources :seller_product_details
    get "home", to: "users#index", as: "home"
    get "seller", to: "seller_info#index",as: "seller_home"
   
end
