Rails.application.routes.draw do
  get 'carts/update'
  get 'carts/show'
  get 'update/show'
  get 'home/index'
  devise_for :users
  devise_for :admins

  authenticate :admin do
    resources :products
    resources :categories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end

  root "home#index"
end
