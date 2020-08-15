Rails.application.routes.draw do
  get 'cat_main/index'
  get 'main/index'
  root "main#index"
end
