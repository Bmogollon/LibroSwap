Rails.application.routes.draw do
resources :users

get '/users/:id', to: 'users#show'
end
