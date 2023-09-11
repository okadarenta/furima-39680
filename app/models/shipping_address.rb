class ShippingAddress < ApplicationRecord
  belongs_to :purchase

validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
validates :prefecture_id, presence: true
validates :city, presence: true
validates :street_address, presence: true
validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
