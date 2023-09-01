class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :username, presence: true
         validates :kanji_first_name, presence: true,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :kanji_last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :katakana_first_name, presence: true,  format: { with: /\A[ァ-ヶー－]+\z/}
         validates :katakana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday, presence: true

         validate :password_complexity

         private

         def password_complexity
           return if password.blank?
       
           unless password.match(/^(?=.*[a-zA-Z])(?=.*\d).+/)
           end
         end
       end
