Rails.application.routes.draw do

  root to: 'home#top'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  namespace :admin do
    resources :users
  end

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
