Rails.application.routes.draw do
  devise_for :users
  
  resources :post_images, only: [:new, :create, :index, :show]

  resources :users, only: [:new, :create] , path_names: { new: 'sign_up' }
  resource :session
  resources :passwords, param: :token
  resource :registration
  resource :session
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  get "homes/top" => "homes#top", as: "top"
  
  # --- ここから追加 ---
  get "homes/about" => "homes#about", as: "about"
  # --- ここまで追加 ---

  root to: "homes#top"
  
  get "up" => "rails/health#show", as: :rails_health_check
end
