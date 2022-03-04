Rails.application.routes.draw do
  get "/users/me" => "users#show"
  post "/users" => "users#create"
  patch "/users/me" => "users#update"
  delete "/users/me" => "users#destroy"

  get "/favorites" => "favorites#index"
  post "/favorites" => "favorites#create"
  delete "/favorites/:id" => "favorites#destroy"

  get "/animes" => "animes#index"
  # get "/animes/:id" => "animes#show"
  
  post "/sessions" => "sessions#create"

end
