Rails.application.routes.draw do

   resources :categories
resources :books
  get 'pages/home'
  get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

   root 'pages#home'


   resources :book do
     resources :likes
   end
resources :users
get '/users/:id', to: 'users#show'

resources :messages, only:[:create]

  resources :users, only:[:new, :create] do
   resources :chats, only: [:index, :show, :create]
  end




end
