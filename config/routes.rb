Colchonet::Application.routes.draw do
  LOCALES ||= /en|es|pt\-BR/ 

  devise_for :admins
  
  # Site  
  scope "(:locale)", locale: LOCALES do
    resources :rooms do
      resources :reviews, only: [:create, :update], module: :rooms
    end
    resources :users
  end
  
  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]

  get '/:locale' => 'homes#index', locale: LOCALES
  root 'homes#index'

  # Admin
  namespace :admin do
    resources :rooms
    resources :users, except: [:create, :new]
    get "about" => "dashboards#about"
    root to: "dashboards#index"
  end
end
