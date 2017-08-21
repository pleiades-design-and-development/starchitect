Rails.application.routes.draw do

scope '/api' do
  scope '/v1' do
    scope :format => true, :constraints => { :format => 'json' } do
    post   "/login"       => "sessions#create"
    delete "/logout"      => "sessions#destroy"
  end
    scope '/users' do
      get '/' => 'users#index'
      post '/' => 'users#create'
      get '/:id' => 'users#show'
    end
    scope '/profile' do
      get '/' => 'profile#index'
    end
    scope '/starmap' do
      get '/' => 'starmap#index'
    end
    scope 'submissions' do
      get '/' => 'submissions#index'
      post '/' => 'submissions#create'
      put '/:id/edit' => 'submissions#update'
    end
  end
end




  # resources :submissions
  # resources :posts
  #
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
