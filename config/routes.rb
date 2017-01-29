Rails.application.routes.draw do
  Heroku::Engine.routes.draw do
    resources :resources, only: [:show, :create, :update, :destroy]
    get 'sso_login', to: 'sso#login'
    post 'sso_login', to: 'sso#login'
  end

  Dashboard::Engine.routes.draw do
    root to: 'pages#show'
    resource :portal, only: [:show]
    resources :scans, only: [:create]
    resources :settings, only: [:edit, :update]
  end

  if ENV['SIDEKIQ_WEB'] == 'YES' || Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  mount Heroku::Engine => '/heroku', as: 'heroku'
  mount Dashboard::Engine => '/', as: 'dashboard'
end
