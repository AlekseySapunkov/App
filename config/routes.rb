Rails.application.routes.draw do
  resources :countries do
  resources :regions do
    resources :cities do
      resources :campings
    end
  end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'countries#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
