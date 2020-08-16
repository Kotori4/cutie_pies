Rails.application.routes.draw do
  get 'main/index'
  root "main#index"
  
  resources :cat_main, only:[:index, :new]
end
