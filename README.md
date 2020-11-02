
## users テーブル

| Column          | Type   | Options     |
| -----------     | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first name      | string | null: false |
| last name       | string | null: false |
| first name(kana)| string | null: false |
| last name(kana) | string | null: false |
| Year of birth   | string | null: false |
| Birth month     | string | null: false |
| Birthday        | string | null: false |

### Association

- has_many :products
- has_one :purchase


## products テーブル

| Column      | Type       | Options                       |
| ----------  | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| text        | string     | null: false                   |
| image       | string     | null: false                   |
| user_id     | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| name        | string       | null: false                    |
| user_id     | references   | null: false, foreign_key: true |
| product_id  | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |      
| postal code   | string     |                                |
| prefectures   | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |
| phone number  | string     | null: false                    |         
| purchase_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase