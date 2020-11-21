class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'は英数混合で入力してください。'}
validates :nickname, presence: true
validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ ,message: 'は全角で入力して下さい。'}
validates :last_name, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/ ,message: 'は全角で入力して下さい。'}
validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
validates :birthday, presence: true
  
end
