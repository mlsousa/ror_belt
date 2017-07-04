Rails.application.routes.draw do

  root 'bright_ideas#index'
  get '/bright_ideas' => 'bright_ideas#index'
  get 'bright_ideas/:id' => 'bright_ideas#show'
  post '/likes' => 'likes#create'
  post '/bright_ideas' => 'bright_ideas#create'



  get '/' => 'sessions#new'
  get '/sessions' => 'sessions#new'
  # post '/sessions' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  post '/login' => 'users#login'
  post '/register' => 'users#register'

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'

  # post '/users/:id' => 'songs#create'







    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
