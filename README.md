#Users

has_many :items
has_many :purchases
|Column|Type|Options|
|------|----|-------|
| username | string | null: false|
| email | string | null: false,unique: true |
| encrypted_password | string | null: false |
| kanji_first_name | string | null: false |
| kanji_last_name | string | null: false |
| katakana_first_name | string |null: false|
| katakana_last_name | string | null: false |
| birthday | date | null: false |

#Items

belongs_to :user, class_name: 'User'
has_one :purchases, dependent: :destroy
|Column|Type|Options|
|------|----|-------|
| title | string | null:false |
| description | text | null: false |
| price | integer | null: false |
| condition_id | string | null: false |
| user | references | null: false, foreign_key: true |
| shipping_duration_id | string | null: false |
| shipping_fee_burden_id | string | null: false |
| category_id | string | null: false |
| prefecture_id | string | null: false |

#Puchases

 belongs_to :user, class_name: 'User'
 belongs_to :item
 belongs_to :shipping_address
|Column|Type|Options|
|------|----|-------|
| user | references | null: false, foreign_key: { to_table: :users } |
| item | references | null: false, foreign_key: true |


#Shippng_addresses

 belongs_to :user
 has_many :purchases
|Column|Type|Options|
|------|----|-------|
| postal_code | string | null: false |
| prefecture_id | string | null: false |
| city | string | null: false |
| street_address | string | null: false |
| building_name | string | |
| phone_number | string | null: false |



