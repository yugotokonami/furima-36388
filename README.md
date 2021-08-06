## usersテーブル

| Column                    | Type               | Option                         |
| --------------------------| -------------------| -------------------------------|
| email                     | string             | null: false, unique: true      |
| password                  | string             | null: false                    |
| encrypted_password        | string             | null: false                    |
| nickname                  | string             | null: false                    |
| first_name                | string             | null: false                    |
| last_name                 | string             | null: false                    |
| first_name_kana           | string             | null: false                    |
| last_name_kana            | string             | null: false                    |
| birthday                  | date               | null: false                    |

## itemsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| title            | string             | null: false                    |
| catch_copy       | text               | null: false                    |
| user             | references         | null: false, foreign_key: true |
| state            | text               | null: false                    |
| price            | text               | null: false                    |
| postage          | text               | null: false                    |
| region           | text               | null: false                    |
| shipping_date    | date               | null: false                    |

## commentsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| text             | text               | null: false                    |
| user             | references         | null: false, foreign_key: true |
| item             | references         | null: false, foreign_key: true |

## ordersテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| order_name       | string             | null: false                    |
| order_address    | string             | null: false                    |
| card_number      | integer            | null: false                    |
| phone_number     | integer            | null: false                    |


## addressesテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| oreder           | references         | null: false, foreign_key: true |
| card_number      | integer            | null: false                    |
| postcode         | integer            | null: false                    |
| prefecture_id    | text               | null: false                    |
| city             | text               | null: false                    |
| block            | text               | null: false                    |
| building         | text               | null: false                    |
| phone_number     | integer            | null: false                    |