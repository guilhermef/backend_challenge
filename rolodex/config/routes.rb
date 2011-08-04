Rolodex::Application.routes.draw do
  resources :contacts do
    collection do
      delete :destroy_ids
    end
  end
  resources :lists
  root :to => 'rolodex#index'
end
