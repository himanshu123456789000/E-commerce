Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  # Defines the root path route ("/")
  resources :products
  resources :carts
  resources :cart_items
  resources :addresses
  # root "articles#index"

  # {"name": "soham", "email": "soham@gmail.com", "password_digest": "123456", "DOB": "1996/07/16", "gender":"male", "role": "seller", "contact": "6260342108"}
end
