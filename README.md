#Users

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

|Column|Type|Options|
|------|----|-------|
| title | string | null:false |
| description | text | null: false |
| price_id | integer | null: false |
| condition | string | null: false |
| user | references | null: false, foreign_key: { to_table: :users } |
| shipping_duration_id | string | null: false |
| shipping_fee_burden_id | string | null: false |
| category_id | string | null: false |
| origin_area_id | string | null: false |

#Puchases

|Column|Type|Options|
|------|----|-------|
| user | references | null: false, foreign_key: { to_table: :users } |
| item | references | null: false, foreign_key: true |


#Shippng_addresses

|Column|Type|Options|
|------|----|-------|
| postal_code | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| street_address | string | null: false |
| building_name | string | |
| phone_number | string | null: false |



