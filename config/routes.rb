Rails.application.routes.draw do

	root 'users#index'

	get 'sessions/new' => 'sessions#new'



	resources :users
	resources :attractions 
	resources :rides

	post "/rides/new" => 'rides#new'


  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout
  post '/logout' => 'sessions#destroy'
	


end
