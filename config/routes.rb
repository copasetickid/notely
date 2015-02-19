Rails.application.routes.draw do

  root 'pages#home'

  resources :notebooks
  resources :notes

  namespace :api do
  	get :csrf, to: 'csrf#index'
	end
end
