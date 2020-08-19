Rails.application.routes.draw do
  devise_for :users
  
  get 'main/index'
  root "main#index"
  
  resources :cat_main do
    collection do 
      get 'posted'
    end
  end

end
