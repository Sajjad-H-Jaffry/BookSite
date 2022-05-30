Rails.application.routes.draw do
  resources :tags
  get 'search', to: 'search#index'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :books do 
    resources :reviews
    resources :contents
  end

  root 'books#index'

end
