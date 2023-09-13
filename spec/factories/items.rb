FactoryBot.define do
  factory :item do
    title { "sample test" }
    description { "This is a sample item description." }
    category { Category.find(2) }
    condition { Condition.find(2) }
    shipping_fee_burden { ShippingFeeBurden.find(2) }
    shipping_duration { ShippingDuration.find(2) }
    price { 500 } 
    prefecture{ Prefecture.find(2) }
    association :user_id
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end