Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :categories do
    resources :products, param: :product_id

  end
  mount RailsEventStore::Browser => '/res'
end
