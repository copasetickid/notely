Rails.application.routes.draw do

  root 'pages#home'

  resources :notebooks
  resources :notes
end
