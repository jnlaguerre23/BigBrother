Rails.application.routes.draw do
    root                'static_pages#home'
    get    'help'    => 'static_pages#help'
    get    'about'   => 'static_pages#about'
    get    'form'    => 'student#new'
    post   'form'    => 'student#create'
    get    'contact' => 'static_pages#contact'
    get    'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

    get 'auth/:provider/callback' => 'sessions#create'
    get 'auth/failure' => redirect('/')
    get 'signout' => 'sessions#destroy', as: 'signout'


#  get 'sessions/new'

#  get 'users/new'

end
