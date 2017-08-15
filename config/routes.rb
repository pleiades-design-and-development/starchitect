Rails.application.routes.draw do
  resources :posts
  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
