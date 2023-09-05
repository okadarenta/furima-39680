class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: { message: "Price can't be blank" }
  validates :price, numericality: { 
  greater_than: 299, 
  less_than_or_equal_to: 9_999_999,
  only_integer: true,
  message: "Price is out of setting range"
}
  validates :price, format: { 
  with: /\A[0-9]+\z/,
  message: "Price is invalid. Input half-width characters"
}
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :user_id, presence: true
  validates :shipping_duration_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
