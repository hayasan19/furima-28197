
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

| Column                  | Type       | Options                       |
| ----------------------  | ---------- | ----------------------------- |
| product_category_id     | integer    | null: false                   |
| product_status_id       | integer    | null: false                   |
| delivery_fee_id         | integer    | null: false                   |
| shipment_source_area_id | integer    | null: false                   |
| days_to_ship_id         | integer    | null: false                   |
| price                   | string     | null: false                   |
| user                    | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| user        | references   | null: false, foreign_key: true |
| product     | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| -----------      | ---------- | ------------------------------ |      
| postal_code      | string     |                                |
| prefectures_id   | integer    | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |         
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase