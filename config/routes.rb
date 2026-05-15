Rails.application.routes.draw do
  root to: "homes#top"
  get "homes/about", to: "homes#about", as: "about"
  
  resource :session
  resource :registration
  resources :passwords, param: :token

  # 投稿画像に関連する回路を一つにまとめます
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # いいね機能（単数形 resource にするのが一般的です）
    resource :favorites, only: [:create, :destroy]
    # コメント機能
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end