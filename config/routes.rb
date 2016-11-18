Rails.application.routes.draw do

  resources :equipment, only: [:new, :create, :show]
  resources :contracts, only:[:new, :create, :show ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: [:new, :create, :show]
end
