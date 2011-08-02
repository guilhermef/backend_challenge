Rolodex::Application.routes.draw do
  resources :lists

  root :to => 'rolodex#index'
end
