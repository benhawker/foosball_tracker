Rails.application.routes.draw do
	root to: "home#index"
	get '/ranking' => 'home#ranking'
	
  resources :users
  resources :teams
  resources :matches
end
