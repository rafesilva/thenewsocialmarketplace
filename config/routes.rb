Rails.application.routes.draw do

  resources :charges, only: [:new, :create]
  ## OLD SESSION, WORKING FOR WITH DEVISE_SCOPES.


  root 'streaming#index'
  
  devise_for :users,  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
    resources :users, only: [ :index, :show, :edit, :update ] 

        as :user do
            get 'signup', to: 'devise/registrations#new', as: 'signup'
            get 'login', to: 'devise/sessions#new', as: 'login'
            post 'login', to: 'devise/sessions#create'  
            get 'logout', to: 'devise/sessions#destroy', as: 'logout'
        end

            post 'follow/:id', to: 'users#follow', as: 'follow_user'
            post 'unfollow/:id', to: 'users#unfollow', as: 'unfollow_user'

            get 'users/:id/products' => 'products#index', :as => :user_products_path


            
            resources :users do
        
              collection do
            
                get :search
              end

            end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages, only: [:new, :create]


  resources :conversations, only: [:index, :show, :destroy]

  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  
  resources :purchases, only: [:show]
  
  resources :transactions

  resources :products
  
  resources :line_items
  resources :carts
  resources :text_comments
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts

end

  # get 'user/:id', to: 'users#index', as: 'users'
  # get 'user/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch 'user/:id', to: 'users#update'
  # put 'user/:id', to: 'users#update'
  # get 'user/:id/edit', to: 'users#update'
  # get 'user/:id', to: 'users#show', as: 'user'
  # delete 'user/delete/:id', to: 'users#destroy'