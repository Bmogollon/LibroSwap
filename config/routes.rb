Rails.application.routes.draw do
  get 'pages/home'
  get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

   root 'pages#home'


resources :users
get '/users/:id', to: 'users#show'
end
