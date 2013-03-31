Blog::Application.routes.draw do
  
  devise_for :users

  resources :movies
  resources :actors

  match "/" => "movies#index"
end
