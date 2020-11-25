# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

- has_many :items
- has_many :purchase_recorders

## items テーブル

| Column             | Type          | Options     |
| ----------         | ----------    | ----------- |
| name               | string        | null: false |
| category_id        | integer       | null: false |
| condition_id       | integer       | null: false |
| description        | text          | null: false |
| postage_type_id    | integer       | null: false |
| preparation_day_id | integer       | null: false |
| ship_from_id       | integer       | null: false |
| price              | integer       | null: false |
| user               | references    | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column               | Type       | Options     |
| ---------            | ---------- | ----------- |
| postal_code          | string     | null: false |
| prefectures_id       | integer    | null: false |
| city                 | string     | null: false |
| house_number         | string     | null: false |
| building_name        | string     | null: false |
| phone_number         | integer    | null: false |
| purchase_recorder    | references | null: false, foreign_key: true |

- belongs_to : purchase_record

## purchase_recorder テーブル

| Column        | Type       | Options     |
| ---------     | ---------- | ----------- |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

- has_one :address
- belongs_to  :user
- belongs_to  :item
