Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'Nosotros', to: 'pages#about', as: 'about'
  resources :contacts, only: :create
  get 'Contactanos', to: 'contacts#new', as: 'new_contact'
end
