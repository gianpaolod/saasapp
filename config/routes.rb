Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile
    member do
      get :following, :followers
    end

  end
  get 'Nosotros',                           to: 'pages#about', as: 'about'
  resources :contacts,                      only: :create
  get 'Contactanos',                        to: 'contacts#new', as: 'new_contact'
  resources :microposts,                    only: [:create, :destroy]
  resources :relationships,                 only: [:create, :destroy]
end
