Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  root to: "page#index"
  resources :productos
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :productos, only: [:index]
    end
  end
  root to: "page#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
