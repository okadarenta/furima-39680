class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :username, presence: true
         validates :kanji_first_name, presence: true
         validates :kanji_last_name, presence: true
         validates :katakana_first_name, presence: true
         validates :katakana_last_name, presence: true
         validates :birthday, presence: true
end
