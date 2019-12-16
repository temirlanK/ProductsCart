Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'api/products', to: 'products#index', as: 'all_products'
  
  scope :api do
    namespace :cart do 
      resources :products
    end
  end

  get 'api/cart', to: 'carts#cart_info', as: 'cart_info' 
   

end
