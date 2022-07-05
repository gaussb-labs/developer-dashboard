Rails.application.routes.draw do
  get 'hosts/index'
  resources :users, except: [:new]
  root "sessions#new"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'hosts/create', to: 'hosts#create'
  get 'users/:id/ssh(.:format)', to: 'users#ssh'
  get 'users/:id/add_host', to: 'users#add_host', as: 'add_host'
  post 'users/:id/add_host', to: 'users#ssh', as: 'ssh'
end
