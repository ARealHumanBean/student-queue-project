Rails.application.routes.draw do
  root 'welcome#index'
  
  get    '/welcome',  to: 'welcome#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/requests/new', to: 'requests#new'
  get '/manage_requests', to: 'requests#index'
  
  get "/from_queue_type" => 'requests#from_queue_type', as: 'from_queue_type'
  
  get '/manage_users', to: 'users#index'
  resources :users do
    collection {post :import}
  end
  resources :requests
  
end
