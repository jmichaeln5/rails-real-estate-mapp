Rails.application.routes.draw do

  root 'pages#home'

  resources :buyers
  resources :sellers

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'
  #
  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'



  get '/buyer_login' => 'buyer_sessions#new'
  post '/buyer_login' => 'buyer_sessions#create'
  get '/buyer_logout' => 'buyer_sessions#destroy'

  get '/buyer_signup' => 'buyers#new'
  post '/buyers' => 'buyers#create'


  get '/seller_login' =>   'seller_sessions#new'
  post '/seller_login' =>   'seller_sessions#create'
  get '/seller_logout' =>   'seller_sessions#destroy'

  get '/seller_signup' => 'sellers#new'
  post '/sellers' => 'sellers#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
