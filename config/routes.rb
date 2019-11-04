Rails.application.routes.draw do
  get 'mourners/index'
  get 'mourners/show'
  get 'mourners/new'
  get 'mourners/create'
  get 'mourners/edit/:id', to: 'mourners#edit'
  get 'mourners/update/:id', to: 'mourners#update'
  devise_for :mourners
  root to: 'mourners#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
