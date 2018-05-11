Rails.application.routes.draw do
  
  resources :transactions
  root 'streaming#index', as: 'streaming_index' 

  resources :line_items
  resources :carts

  resources :purchases, only: [:show]
  resources :products
  resources :text_comments
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  devise_for :users,  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  post 'follow/:id', to: 'users#follow', as: 'follow_user'
  post 'unfollow/:id', to: 'users#unfollow', as: 'unfollow_user'


  # get 'user/:id', to: 'users#index', as: 'users'
  # get 'user/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch 'user/:id', to: 'users#update'
  # put 'user/:id', to: 'users#update'
  # get 'user/:id/edit', to: 'users#update'
  # get 'user/:id', to: 'users#show', as: 'user'
  # delete 'user/delete/:id', to: 'users#destroy'
  get 'users/:id/products' => 'products#index', :as => :user_products_path

  resources :users, only: [ :index, :show, :edit, :update ]

  ## OLD SESSION, WORKING FOR WITH DEVISE_SCOPES.
  as :user do
  get 'signup', to: 'devise/registrations#new', as: 'signup'
  get 'login', to: 'devise/sessions#new', as: 'login'
  post 'login', to: 'devise/sessions#create'  

 get '/users/sign_out' => 'devise/sessions#destroy' 
  
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
