Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, :only => [:create, :new, :show]

  root 'urls#new'

  match '*id' => 'urls#show', via: :get
end
