Rails.application.routes.draw do

  get 'merchants/index'
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

            get 'users/:id/products' => 'products#index', :as => :user_products
            post 'users/:id/products' => 'products#destroy', :as => :user_products_destroy
         
            get 'thanks', to: 'charges#thanks', as: 'thanks'

           
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'merchants#index'
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end

  resources :admin do
    resources :users do
      collection do
        put :approve
      end
    end
  end

  resources :transactions

  resources :merchants do
    resources :items
    resources :transactions
  end

  resources :users do
    resources :merchants
    resources :transactions
  end  
  
  resources :charges, only: [:new, :create]


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
      post :mark_as_read
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  
  resources :purchases, only: [:show]
  

  resources :products
  
  resources :tasks
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