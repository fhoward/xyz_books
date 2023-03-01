Rails.application.routes.draw do
  root 'home#index'
  get '/search', to: 'home#search'
  get '/books', to: 'books#index'
  get '/books/:isbn_13', to: 'books#show' 
  get 'convert_isbn', to: 'books#convert_isbn'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
