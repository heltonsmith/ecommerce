Rails.application.routes.draw do
  get 'carts/update'
  get 'carts/show'
  get 'carts/exito'
  get 'update/show'
  get 'home/index'
  devise_for :users
  devise_for :admins

  authenticate :admin do
    resources :products
    resources :categories
  end

  resource :cart, only: [:show, :update, :exito] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
      get  :exito
    end
  end

  root "home#index"
end
