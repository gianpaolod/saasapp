Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile
  end
  get 'Nosotros', to: 'pages#about', as: 'about'
  resources :contacts, only: :create
  get 'Contactanos', to: 'contacts#new', as: 'new_contact'
end
