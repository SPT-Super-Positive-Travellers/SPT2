Rails.application.routes.draw do

  get 'maps/index'
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: "about"

    resources :items,        only: [:index, :show]
    resources :destinations, only: [:index, :edit, :create, :update, :destroy]
    resources :maps,         only: [:index]

    get 'customers' => 'customers#show'
    get 'customers/confirm'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information'    => 'customers#update'
    patch 'customers/quit'

    resources :item_genres do
      member do
        get 'search'
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
  end

  namespace :admin do
    get '/' => 'homes#top'

    resources :items,       only: [:index, :new, :create, :show, :edit, :update]
    resources :item_genres, only: [:index, :create, :edit, :update]
    resources :customers,   only: [:index, :show, :edit, :update]
    resources :orders,      only: [:show, :update]
    resources :order_items, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
