
# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | unique: true , null: false |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| name         | string       | null: false       |
| comment      | text       | null: false       |
| category_id  | integer    | null: false       |
| condition_id | integer    | null: false       |
| postage_id   | integer    | null: false       |
| ship_form_id | integer    | null: false       |
| etd_id       | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## destinations テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| postal_code           | string     | null: false       |
| ship_form_id          | integer    | null: false       |
| city                  | string     | null: false       |
| address               | string     | null: false       |
| building              | string     | 
| phone_number          | string     | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :purchases

## purchases テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item                  | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :destination
