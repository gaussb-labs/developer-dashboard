Rails.application.routes.draw do
  resources :users, except: [:new]
  root "sessions#new"
  get 'ssh', to: 'users#ssh'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
