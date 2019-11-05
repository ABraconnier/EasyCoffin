Rails.application.routes.draw do

  devise_for :clients, path: 'clients', controllers: { registrations: "clients/registrations" }
  resources :clients

  devise_for :mourners, path: 'mourners', controllers: { registrations: "mourners/registrations" }
  resources :mourners
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
