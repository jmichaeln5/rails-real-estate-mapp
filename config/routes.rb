Rails.application.routes.draw do

  root 'pages#home'
  get '/about' => 'pages#about'
  get '/test' => 'pages#test'

  get '/seller_signup' => 'sellers#new'
  post '/sellers' => 'sellers#create'

  get '/buyer_signup' => 'buyers#new'
  post '/buyers' => 'buyers#create'

  get '/login' =>   'sessions#new'
  post '/login' =>   'sessions#create_seller'
  post '/login' =>   'sessions#create_buyer'
  get '/logout' => 'sessions#destroy'

  get '/directions' => 'directions#index'

  resources :buyers

  resources :sellers do
    resources :listings, only: [:index, :new, :create]
  end
  resources :listings, only: [:show, :edit, :update, :destroy]

  get '/listings' => 'listings#all_listings'


  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'
  #
  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
