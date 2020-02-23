Rails.application.routes.draw do

  
  root to: 'home#top'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  namespace :admin do
    resources :users
  end

  get "admin/users/:id/likes" => "users#likes"

  resources :posts

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

end
