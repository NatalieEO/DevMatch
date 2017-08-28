Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts
  # makes custom URL. contact/new changes to contact-us
  # Whenver rails gets a get request for /contact-us, 
  # rails knows to run the contacts controller new action.
  get 'contact-us', to: 'contacts#new'
end
