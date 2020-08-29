Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  
  mount ActionCable.server => '/cable'
  root "main#index"
  
  resources :rooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create] 
  end
    
  resources :vets do
  resources :vet_comments, only: :create
end
  
  resources :items do
    resources :item_comments, only: :create
  end
  
  resources :cat_post do
    resources :cat_post_comments, only: :create
    collection do 
      get 'posted'
    end
  end
end

