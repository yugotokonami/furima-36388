## usersテーブル

| Column                    | Type               | Option                         |
| --------------------------| -------------------| -------------------------------|
| email                     | string             | null: false, unique: true      |
| encrypted_password        | string             | null: false                    |
| nickname                  | string             | null: false                    |
| first_name                | string             | null: false                    |
| last_name                 | string             | null: false                    |
| first_name_kana           | string             | null: false                    |
| last_name_kana            | string             | null: false                    |
| birthday                  | date               | null: false                    |

### Association

- has_many :items
- has_many :comments

## itemsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| name             | string             | null: false                    |
| catch_copy       | text               | null: false                    |
| price            | integer            | null: false                    |
| state            | text               | null: false                    |
| postage          | text               | null: false                    |
| prefecture_id    | integer            | null: false                    |
| shipping_date    | date               | null: false                    |
| category         | string             | null: false                    |
| user             | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| text             | text               | null: false                    |
| user             | references         | null: false, foreign_key: true |
| item             | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| order_name       | string             | null: false                    |
| order_address    | string             | null: false                    |
| phone_number     | string             | null: false                    |

### Association

- has_one :address

## addressesテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| oreder           | references         | null: false, foreign_key: true |
| postcode         | string             | null: false                    |
| prefecture_id    | integer            | null: false                    |
| city             | string             | null: false                    |
| block            | string             | null: false                    |
| building         | string             | null: false                    |
| phone_number     | string             | null: false                    |

### Association

- belongs_to :order