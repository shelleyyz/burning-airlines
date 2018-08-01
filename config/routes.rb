Rails.application.routes.draw do
  get 'session/new'
  root :to => 'session#new'

  resources :planes
  resources :reservations
  resources :flights
  resources :users

  get '/login' => 'session#new' #login form
  post '/login' => 'session#create' #perform a login
  delete '/login' => 'session#destroy' #perform a log out

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
