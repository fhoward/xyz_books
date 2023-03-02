Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'home#search'
  namespace :api do
    get '/books', to: 'books#index'
    get '/books/:isbn_13', to: 'books#show' 
    get 'convert_isbn', to: 'books#convert_isbn'
  end
end
