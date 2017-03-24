Rails.application.routes.draw do
  root to: 'pages#home'
  get 'Nosotros', to: 'pages#about', as: 'about'
  resources :contacts, only: :create
  get 'Contactanos', to: 'contacts#new', as: 'new_contact'
end
