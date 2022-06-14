Rails.application.routes.draw do
  resources :users, except: [:new]
  root "pages#home"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#destroy'
end
