FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    username { 'testuser' }
    kanji_first_name { '太郎' }
    kanji_last_name { '山田' }
    katakana_first_name { 'タロウ' }
    katakana_last_name { 'ヤマダ' }
    birthday { Date.new(1990, 1, 1) }
  end
end