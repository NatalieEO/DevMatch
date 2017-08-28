Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts
  #makes custom URL. contact/new changes to contact-us
  get 'contact-us', to: 'contacts#new'
end
