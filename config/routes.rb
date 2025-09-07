Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'   # Home page
  resources :books do
    member do
      get :confirm_destroy
    end
  end
end
