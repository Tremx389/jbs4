Blog::Application.routes.draw do
  
  resources :movies
  match "/" => "movies#index"

end
