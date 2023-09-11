class PurchaseForm
  include ActiveModel::Model

  attr_accessor :postal_code,  :prefecture_id,  :city, :street_address,  :building_name,  :phone_number,  :item_id, :user_id, :purchase_id

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  def save
      purchase = Purchase.create(
        user_id: user_id,
        item_id: item_id
      )

      ShippingAddress.create(
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        street_address: street_address,
        building_name: building_name,
        phone_number: phone_number,
        purchase_id: purchase_id
      )
    end
  end
