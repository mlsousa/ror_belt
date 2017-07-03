Rails.application.routes.draw do

  get '/' => 'sessions#new'
  get '/sessions' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  post '/login' => 'sessions#login'

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'
  post '/users/:id' => 'songs#create'
  post '/register' => 'users#register'

  get '/songs/index' => 'songs#index'
  get '/songs' => 'songs#index'
  get '/songs/:id' => 'songs#show'
  post '/songs' => 'songs#create'
  post '/songs/:id' => 'playlist_songs#create'
  patch '/songs' => 'playlist_songs#create'

  get 'playlists' => 'playlists#create'




    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
