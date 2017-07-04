Rails.application.routes.draw do

  get '/' => 'sessions#new'
  get '/sessions' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  post '/login' => 'sessions#login'

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'

  # post '/users/:id' => 'songs#create'

  post '/register' => 'users#register'





    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
