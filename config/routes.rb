# frozen_string_literal: true

Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/edit'
  get 'payments/create'
  get 'payments/update'
  get 'payments/destroy'
  get 'welcome/index'
  get 'sessions/new'
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
