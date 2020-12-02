class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         with_options presence: true do
         validates :nickname, presence: true
         validates :birthday, presence: true
         end
         with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'は英数混合で入力してください。'} do
         validates :password
         end
         
         with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ ,message: 'は全角で入力して下さい。'} do
         validates :first_name
         validates :last_name
         end
         
         with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'} do
          validates :first_name_kana
          validates :last_name_kana
          end
          end
        
         
