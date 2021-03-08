
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

### Association
- has_many :items
- has_many :destinations
- has_many :purchases

## item テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| name         | text       | null: false       |
| comment      | text       | null: false       |
| category     | string     | null: false       |
| condition_id | integer    | null: false       |
| postage_id   | integer    | null: false       |
| ship_fom_id  | integer    | null: false       |
| etd_id       | integer    | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :destination
- has_one :purchase

## destination テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| postal_code           | string     | null: false       |
| region                | string     | null: false       |
| city                  | string     | null: false       |
| address               | string     | null: false       |
| building              | string     | 
| phone_number          | string     | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :item

## purchase テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item_id               | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :item
