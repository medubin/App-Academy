Rails.application.routes.draw do
  resources :users, only:    [:show, :index, :update, :destroy, :create]
  resources :contacts, only: [:show, :index, :update, :destroy, :create]

  resources :contact_shares, only: [:create, :destroy]
  # get '/users' => 'user#index'
  # post '/users' => 'user#create'
  # get '/users/new' => 'users#new'
  # get '/users/:id/edit' => 'users#edit'
  # get '/users/:id' => 'users#show'
  # patch '/users/:id' => 'users#update'
  # put '/users/:id' => 'users#update'
  # delete '/users/:id' => 'users#destroy'
end
