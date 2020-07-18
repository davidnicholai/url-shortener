Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :urls, :only => [:create, :new, :show, :update, :destroy]
  resources :users, :only => [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # root 'urls#new'
  root 'sessions#welcome'

  match '*id' => 'urls#show', via: :get
end
