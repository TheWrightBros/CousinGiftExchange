App::Application.routes.draw do

  get "users/new"
  root to: 'content#home'

  resources :users

end
