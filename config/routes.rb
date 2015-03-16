Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'help' => 'static_pages#help'
  resources :account_activations, only: [:edit]

  resources :users


end
