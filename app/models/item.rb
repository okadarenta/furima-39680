class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :item_shipping
  belongs_to :item_prefecture
  belongs_to :scheduled_delivery

  belongs_to :user
  has_one_attached :image

 validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :item_shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
