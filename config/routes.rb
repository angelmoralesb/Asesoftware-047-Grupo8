Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  
  resources :productos
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :productos, only: [:index,:create,:show]
      devise_scope :user do
      
      match '/sessions' => 'sessions#create', via: :post
      match '/sessions' => 'sessions#destroy', via: :delete
      end
      devise_scope :productos do
        match '/productos' => 'productos#create', via: :post
        match '/productos' => 'productos#destroy', via: :delete
        end
    end
  end
  root to: ('page#index')
  #root to: redirect ("devise/sessions#new")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
