## usersテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| email            | string             | null: false                    |
| password         | string             | null: false                    |
| nickname         | string             | null: false                    |
| name             | string             | null: false                    |
| birthday         | string             | null: false                    |

## itemsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| title            | string             | null: false                    |
| catch_copy       | text               | null: false                    |
| concept          | text               | null: false                    |
| user             | references         | null: false, foreign_key: true |

## commentsテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| text             | text               | null: false                    |
| user             | references         | null: false, foreign_key: true |
| item             | references         | null: false, foreign_key: true |

## ordersテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| oreder_name      | string             | null: false                    |
| order_address    | string             | null: false                    |

## addressesテーブル

| Column           | Type               | Option                         |
| -----------------| -------------------| -------------------------------|
| oreder           | references         | null: false, foreign_key: true |