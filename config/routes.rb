Rails.application.routes.draw do
    root                'static_pages#home'
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'form'    => 'users#form'
    get    'contact' => 'static_pages#contact'
    get    'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    post   'form'    => 'users#create'
    delete 'logout'  => 'sessions#destroy'
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]


#  get 'sessions/new'

#  get 'users/new'

end
