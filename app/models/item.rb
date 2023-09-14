class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: { message: "を入力してください" },
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true, message: "が設定範囲外です" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_duration_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
end
