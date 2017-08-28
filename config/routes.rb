Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  
  # resources will have rails create 7 different routes, but we only need
  # two. new and create. GET and POST in HTTP verb
  resources :contacts, only: :create
  # makes custom URL. contact/new changes to contact-us. Whenver rails gets a get request for /contact-us,
  # rails knows to run the contacts controller new action. This gives us new/GET
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
