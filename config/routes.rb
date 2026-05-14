Rails.application.routes.draw do
  resources :users, only: [:new, :create] , path_names: { new: 'sign_up' }
  resource :session
  resources :passwords, param: :token
  
  get "homes/top" => "homes#top", as: "top"
  
  # --- ここから追加 ---
  get "homes/about" => "homes#about", as: "about"
  # --- ここまで追加 ---

  root to: "homes#top"
  
  get "up" => "rails/health#show", as: :rails_health_check
end
