Rails.application.routes.draw do
  Heroku::Engine.routes.draw do
    resources :resources, only: [:show, :create, :update, :destroy]
    get 'sso_login', to: 'sso#login'
  end

  Dashboard::Engine.routes.draw do
    root to: 'pages#show'
    resource :portal, only: [:show]
    resources :scans, only: [:create]
  end

  mount Heroku::Engine => '/heroku', as: 'heroku'
  mount Dashboard::Engine => '/', as: 'dashboard'
end
