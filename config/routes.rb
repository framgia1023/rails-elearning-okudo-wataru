Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resources :categories do
      resources :words
    end
  end


  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/admin/home', to: 'admin#home'

  resources :relationships, only: [:create, :destroy]
  resources :categories
  resources :words

  # resources :lessons

  resources :users do
    resources :lessons do
      resources :answers, only: [:new, :create, :index]
    end
  end

end

