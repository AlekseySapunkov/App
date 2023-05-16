Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'campings/index'
      post 'campingss/create'
      delete 'campings/:id', to: 'campings#destroy'
    end
  end
  resources :countries do
  resources :regions do
    resources :cities do
      resources :campings
    end
  end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'campings#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
