Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :users

end

