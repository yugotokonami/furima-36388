class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください'} do
  validates :password
  validates :password_confirmation
 end

 with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角文字を使用してください' } do
  validates :first_name
  validates :last_name
 end

 with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カナを使用してください' } do
  validates :first_name_kana
  validates :last_name_kana
 end

 with_options presence: true do
  validates :nickname
  validates :birthday
 end
end