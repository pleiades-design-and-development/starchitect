Rails.application.routes.draw do

  get 'session/create'

  get 'session/destroy'

scope '/api' do
  scope '/v1' do
    scope '/users' do
      get '/' => 'users#index'
      post '/' => 'users#create'
    end
  end
end




  # resources :submissions
  # resources :posts
  #
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
