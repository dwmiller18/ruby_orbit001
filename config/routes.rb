Rails.application.routes.draw do
  root 'html_pages#home'
  # get 'html_pages/home'
  # get 'html_pages/help'
  get 'help', to: 'html_pages#help'
  # get 'html_pages/about'
  get 'about', to: 'html_pages#about'
  # get 'html_pages/contact'
  get 'contact', to: 'html_pages#contact'
  # now have users controller
  get 'signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :snapshots,     only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
