Rolodex::Application.routes.draw do
  resources :contacts   
  resources :lists
  root :to => 'rolodex#index'
end
