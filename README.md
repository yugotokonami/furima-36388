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
- has_many :orders

## itemsテーブル

| Column              | Type                  | Option                         |
| --------------------| ----------------------| -------------------------------|
| name                | string                | null: false                    |
| catch_copy          | text                  | null: false                    |
| price               | integer               | null: false                    |
| state_id            | integer               | null: false                    |
| postage_id          | integer               | null: false                    |
| prefecture_id       | integer               | null: false                    |
| shipping_date_id    | integer               | null: false                    |
| category_id         | integer               | null: false                    |
| user                | references            | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

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
| user             | references         | null: false, foreign_key: true |
| item             | references         | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addressesテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| oreder           | references         | null: false, foreign_key: true |
| postcode         | string             | null: false                    |
| prefecture_id    | integer            | null: false                    |
| city             | string             | null: false                    |
| block            | string             | null: false                    |
| building         | string             |                                |
| phone_number     | string             | null: false                    |

### Association

- belongs_to :order
