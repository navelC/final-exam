Rails.application.routes.draw do
<<<<<<< HEAD
  
=======
>>>>>>> upstream/master
  root "posts#index"

  resources :posts
  resources :users

<<<<<<< HEAD
  namespace :admin do 
    resources :posts
    resources :users
    resources :categories
    root to: "posts#index"
  end
  
  get '/user/login', to: 'users#login'
=======
>>>>>>> upstream/master
  get '/user/login', to: 'users#login'
  post '/user/login', to: 'users#login'
  get '/user/logout', to: 'users#logout'
  post '/users/new', to: 'users#create'
<<<<<<< HEAD
  post '/users/:id', to: 'users#topup'
=======
>>>>>>> upstream/master

  post 'posts/:id', to: 'bills#create'

  get 'posts/ajax/category_selection', to: 'posts#category_selection'
  get 'posts/ajax/province_selection', to: 'posts#province_selection'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
