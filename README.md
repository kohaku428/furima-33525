# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| category       | string     | null: false                    |
| active_hash    | integer    | null: false                    |
| price          | integer    | null: false                    |
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal       | integer | null: false |
| active_hash  | integer | null: false |
| cities       | string  | null: false |
| house_number | string  | null: false |
| building     | string  |             |
| telephone    | integer | null: false |

### Association

- belongs_to :purchase
