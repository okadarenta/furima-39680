FactoryBot.define do
  factory :purchase_form do
    postal_code   {"123-1234"}
    prefecture_id { 3}
    city          {"テスト市テスト町"}
    street_address       {"テスト1-11"}
    building_name {"テストビル"}
    phone_number  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
   
    association :user_id
    association :item_id
  end
end
