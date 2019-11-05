Rails.application.routes.draw do

  devise_for :clients, path: 'clients'
  resources :clients

  devise_for :mourners, path: 'mourners'
  resources :mourners

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
