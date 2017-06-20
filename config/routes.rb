Rails.application.routes.draw do
  root 'welcome#index'
  
  get    '/welcome',  to: 'welcome#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    collection {post :import}
  end
  get '/manage_users', to: 'users#index'
  
  resources :requests do 
    collection do 
      delete 'destroy_all'
      delete 'destroy_all_current_queue_type'
    end
  end
  get '/requests/new', to: 'requests#new'
  get '/manage_requests', to: 'requests#index'
end
