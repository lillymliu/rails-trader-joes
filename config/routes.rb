Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :photos, only: [:new, :create, :index, :destroy]

	resources :lists do
    	resources :photos
  	end

	root 'lists#index'

	get '/signup', to: 'users#new'
	resources :users

	get '/login', to: 'sessions#new'

	post 'login', to: 'sessions#create'

	delete 'logout', to: 'sessions#destroy'

	get '/list/:id', to: 'lists#show'

	get '/list/new', to: 'lists#new'

end
