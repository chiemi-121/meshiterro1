Rails.application.routes.draw do
  # 1. トップページとAboutページの設定
  root to: "homes#top"
  get "homes/top" => "homes#top", as: "top"
  get "homes/about" => "homes#about", as: "about"

  # 2. Rails 8 標準認証システム（Authentication）の配線
  # ※ devise_for :users は Rails 8 の新機能と競合するため撤去しました
  resource :session
  resource :registration
  resources :passwords, param: :token
  
  # 複数あった記述を 1つに統合しました
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  # 4. ユーザー関連（マイページ、プロフィール編集）
  # 重複を排除し、必要な機能（show, edit, update）に絞りました
  resources :users, only: [:new, :create, :show, :edit, :update] , path_names: { new: 'sign_up' }
  # ヘルスチェック用（システム標準）
  get "up" => "rails/health#show", as: :rails_health_check
end