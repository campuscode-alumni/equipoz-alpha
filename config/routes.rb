Rails.application.routes.draw do
  root 'contracts#index'
  resources :equipment, only: [:new, :create, :show]
  resources :contracts, only:[:new, :create, :show, :index]
  resources :customers, only: [:new, :create, :show]
  resources :contracts, only: [:new, :create, :show] do
    member do
      get 'delivery_receipt', to: 'delivery_receipts#show'
      post 'delivery_receipt', to: 'delivery_receipts#create'
    end
  end
end
