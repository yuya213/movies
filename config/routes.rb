Rails.application.routes.draw do
 
  # 会員用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # ゲストログイン用
  # URL /public/guest_sign_in ...
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/customers/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :movies, only:[:index, :new, :create, :show, :edit, :update]
    resources :reviews, only:[:show, :update, :destroy] do
     resources :comments, only: [:create, :destroy]
    end
  end
  
  
  # ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get "search" => "searches#search", as: "search"
    
    resources :customers, only:[:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "customers/:id/quit" => "customers#quit", as: "quit_customer"
    patch "customers/:id/out" => "customers#out", as: "out_customer"
    
    resources :movies, only: [:index, :show]
    get "searches" => "movies#search", as: "movies_search"
    resources :reviews, only:[:index, :show, :edit, :new, :create, :destroy, :update] do
      collection do
          get 'genre/:id' =>'reviews#genre', as: 'genre'
        end
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end
    
  end

end