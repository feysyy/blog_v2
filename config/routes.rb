Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Rails.application.routes.draw do
  #   get '/articles' => 'articles#index'
  # end
  
  resources :articles do
    resources :comments
  end
  root "articles#index"
end
