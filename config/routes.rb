Rails.application.routes.draw do
  root 'tasks#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [] do
    resources :tasks, only: :index
  end
  resources :tasks, only: [:create, :update]

  # api用のルーティング
  namespace :api do
    get 'login', to: 'login#show'
    resources :tasks, only: [:index, :create, :update]
  end
end
