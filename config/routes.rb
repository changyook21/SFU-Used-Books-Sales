Rails.application.routes.draw do
  root to: 'books#index'
  
  resources :books do
    resources :reviews
  end
  

  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'profile' => 'static_pages#profile'
  get    'login'   => 'sessions#new'
 
  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations'}

end
