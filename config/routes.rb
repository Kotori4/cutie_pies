Rails.application.routes.draw do
  devise_for :users

  root "main#index"

  resources :foods 
  resources :cat_post do
    resources :cat_post_comments, only: :create
    collection do 
      get 'posted'
    end
  end
end

