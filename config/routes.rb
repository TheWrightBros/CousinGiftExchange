App::Application.routes.draw do

  root to: 'content#home'

  resources :users

end
