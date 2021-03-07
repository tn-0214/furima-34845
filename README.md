
# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |

### Association
- has_many :items
- has_many :purchases

## item テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| item_name    | text       | null: false       |
| item_comment | text       | null: false       |
| category     | string     | null: false       |
| condition    | string     | null: false       |
| postage      | string     | null: false       |
| ship_fom     | string     | null: false       |
| etd          | string     | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| card_number           | integer    | null: false       |
| card_expiration_month | integer    | null: false       |
| card_expiration_year  | integer    | null: false       |
| security_code         | integer    | null: false       |
| postal_code           | integer(7) | null: false       |
| region                | string     | null: false       |
| city                  | string     | null: false       |
| address               | string     | null: false       |
| building              | string     | 
| phone_number          | integer    | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :item