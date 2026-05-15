class User < ApplicationRecord
  # 認証システム（Rails 8 標準機能）の設定
  has_secure_password 
  has_many :sessions, dependent: :destroy

  # Active Storageの設定（プロフィール画像用）
  has_one_attached :profile_image

  # アソシエーション（1人のユーザーはたくさんの投稿を持つ）
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # プロフィール画像を取得するためのメソッド
  # 引数(width, height)でサイズを自由に指定できるようにします
  def get_profile_image(width, height)
    unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
     
  end
end