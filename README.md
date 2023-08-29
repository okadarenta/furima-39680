#Users

|Column|Type|Options|
|------|----|-------|
| username | string | null: false|
| email | string | null: false |
| password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| address | text |-------|
| phone_number | string | limit: 20 |

#Items

|Column|Type|Options|
|------|----|-------|
| title | string | null:false |
| description | text |-------|
| price | decimal | precision: 10, scale: 2, null: false |
| condition | string |-------|
| seller | references | null: false, foreign_key: { to_table: :users } |
| status | string | null: false, deafault: "出品中" |

#Puchases

|Column|Type|Options|
|------|----|-------|
| buyer | references | null: false, foreign_key: { to_table: :users } |
| item | references | null: false, foreign_key: true |
| quantity | integer | null: false |
| total_price | decimal | precision: 10, scale: 2, null: false |
| status | string | null: false, default: "支払い待ち" |

#Shippng_address

|Column|Type|Options|
|------|----|-------|
| user | referenes | null: false, foreign_key: true |
| name | string | null: false |
| address | text | null: false |



