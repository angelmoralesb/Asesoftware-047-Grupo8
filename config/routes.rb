Rails.application.routes.draw do
  devise_for :users

  resources :productos
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :productos, only: [:index,:create,:show]
      devise_scope :user do
      
      match '/sessions' => 'sessions#create', via: :post
      match '/sessions' => 'sessions#destroy', via: :delete
      end
      
    
        match '/productos' => 'productos#create', via: :post
        match '/productos' => 'productos#destroy', via: :delete
      
        
    end
  end
  devise_scope :user do
  
  authenticated :user do
    root to: 'page#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end
end
  #root to: redirect ('devise/sessions#new')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
