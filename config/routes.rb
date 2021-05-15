Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to:'pages#about'
  get 'signup', to:'users#new'
  post 'approve', to: 'users#approve'
  post 'reject', to: 'users#reject'
  resources :users, except: [:new]
  resources :departments
  resources :asset_types
  resources :make_models
  resources :location_types
  resources :locations 
  resources :enterprise_assets 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
