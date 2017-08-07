Rails.application.routes.draw do

  resources 'backends',only: [:index]
  namespace :backends do
    root to: 'backends#index'
    resource :sessions , only: [:create,:destroy]
    resources :systems,only: %w(edit update)
    resources :admins do
      collection do
        get :login
      end
    end
    resources :products
    resources :contents
    resources :categories
    post 'carts/add_session'
    post 'carts/delete_session'
    resources :orders
    resources :attachments do
      collection do
        post :sort
        post :ck_upload
        delete :delete
      end
    end
    resources :navs do
      collection do
        post :sort
      end
    end

  end
  get 'homes/map_view'
  resources 'homes',only: [:index]
    root 'homes#index'
  namespace :homes do
    get 'products/cart'
    get 'products/order_build'
    resources 'products'
  end
end
