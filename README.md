
## users テーブル

| Column          | Type   | Options     |
| -----------     | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |


### Association

- has_many :products
- has_one :purchase


## products テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| name                 | string     | null: false                   |
| text                 | string     | null: false                   |
| image                | string     | null: false                   |
| product_category     | string     | null: false                   |
| product_status       | string     | null: false                   |
| delivery_fee         | string     | null: false                   |
| shipment_source_area | string     | null: false                   |
| Days_to_ship         | string     | null: false                   |
| price                | string     | null: false                   |
| user_id              | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| user_id     | references   | null: false, foreign_key: true |
| product_id  | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| -----------      | ---------- | ------------------------------ |      
| postal_code      | string     |                                |
| prefectures_id   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |         
| purchase_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase