Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    resources :likes, only:[:create, :destroy]
    member do 
      post "created_rt"
    end 
  end 

  resources :friends do 
  resources :user
  end 

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "tweets#index"
  
end
