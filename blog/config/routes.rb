Blog::Application.routes.draw do
  
  resources :movies
  resources :actor

  match "/" => "movies#index"

end
