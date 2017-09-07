Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      post   '/signup' => 'users#create'
      post   '/login' => 'sessions#create'
      delete '/logout' => 'sessions#destroy'
      resources :activities
      resources :users
      resources :submissions do
        resources :comments
      end
    end
  end
end
