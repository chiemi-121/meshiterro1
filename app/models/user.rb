class User < ApplicationRecord
  # 不要な認証システム（devise）を一時的に眠らせます
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  has_secure_password # ← こちらをメインの認証に使います
  has_many :sessions, dependent: :destroy

  # ここも念のため、もしエラーが出るようなら後で調整しましょう
  # normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :post_images, dependent: :destroy
end
