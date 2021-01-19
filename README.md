# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| price          | integer    | null: false                    |
| shipping cost  | string     | null: false                    |
| shipping agent | string     | null: false                    |
| shipping time  | storing    | null: false                    |

### Association

- belongs_to :user
- has_many   :purchase

## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |
| credit_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address
- has_one    :credit

## address テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| postal    | integer | null: false |
| address   | text    | null: false |
| telephone | integer | null: false |

### Association

- belongs_to :purchase

## credit テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | integer | null: false |
| number   | integer | null: false |
| security | integer | null: false |

### Association

- belongs_to :purchase