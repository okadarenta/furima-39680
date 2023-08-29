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

#Items

|Column|Type|Options|
|------|----|-------|
| title | string | null:false |
| description | text | null: false |
| price | decimal | precision: 10, scale: 2, null: false |
| condition | string | null: false |
| seller | references | null: false, foreign_key: { to_table: :users } |
| shipping_duration | string | null: false |
| shipping_fee_burden | string | null: false |
| category | string | null: false |
| origin_area | string | null: false |
| image | binary | null: false |

#Puchases

|Column|Type|Options|
|------|----|-------|
| buyer | references | null: false, foreign_key: { to_table: :users } |
| item | references | null: false, foreign_key: true |
| item_price | decimal | precision: 10, scale: 2, null: false |

#Shippng_addresses

|Column|Type|Options|
|------|----|-------|
| user | referenes | null: false, foreign_key: true |
| name | string | null: false |
| address | text | null: false |



