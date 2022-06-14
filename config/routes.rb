Rails.application.routes.draw do
  get 'pages/home'
  get 'signup', to: 'users#new'
  root "pages#home"
  resources :users, except: [:new]
end
