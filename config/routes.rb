Rails.application.routes.draw do

  get 'home' => 'home#index'

  resources :users

end
