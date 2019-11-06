Rails.application.routes.draw do

  post 'prestations', to: "prestations#create"
  devise_for :clients, path: 'clients', controllers: { registrations: "clients/registrations" }
  resources :clients, only: [:edit, :update]

  devise_for :mourners, path: 'mourners', controllers: { registrations: "mourners/registrations" }
  resources :mourners, only: [:index, :show, :edit, :update]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
