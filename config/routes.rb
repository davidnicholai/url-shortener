Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, :only => [:create, :new, :show]
  resources :go, :only => [:show]

  root 'urls#new'
end
