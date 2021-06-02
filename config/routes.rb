Rails.application.routes.draw do

  get 'sessions/new'
  root 'static_pages#home'
  #get 'static_pages/home'
  
  #get 'static_pages/help'
  get '/help',    to: 'static_pages#help'
 
  #get 'static_pages/about'
  get '/about',   to: 'static_pages#about'

  #get 'static_pages/contact'
  get '/contact', to: 'static_pages#contact'

  get '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
