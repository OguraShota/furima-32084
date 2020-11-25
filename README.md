# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | text   | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | text   | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |

- has_many :items

## items テーブル

| Column          | Type       | Options     |
| ----------      | ---------- | ----------- |
| item_img        | string     | null: false |
| item_name       | string     | null: false |
| category        | string     | null: false |
| item_condition  | text       | null: false |
| item_description| text       | null: false |
| postage_type    | string     | null: false |
| preparation_day | integer    | null: false |
| ship_from       | string     | null: false |
| price           | integer    | null: false |
| saler_id        | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column        | Type       | Options     |
| ---------     | ---------- | ----------- |
| postal_code   | integer(7) | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| house_number  | integer    | null: false |

- belongs_to : purchase_record

## purchase_recorder テーブル

| Column        | Type       | Options     |
| ---------     | ---------- | ----------- |
| item_id       | references | null: false, foreign_key: true |
| purchase_date | integer    | null: false |
| buyer_id      | references | null: false, foreign_key: true |

- has_many :addresses
- belongs_to  :item
