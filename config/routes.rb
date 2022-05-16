Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root 'books#index'
  
  # devise_scope :book do  
  #   get '/books/:id' => 'books#destroy'     
  # end
  
  resources :books
  
end
