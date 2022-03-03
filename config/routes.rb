Rails.application.routes.draw do
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/favorites" => "favorites#index"
  post "/favorites" => "favorites#create"
  delete "/favorites/:id" => "favorites#destroy"

  get "/animes" => "animes#index"
  get "/animes/:id" => "animes#show"
  
  post "/sessions" => "sessions#create"

end
