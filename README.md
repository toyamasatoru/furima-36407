#テーブル設計

##users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :purchases
- has_many :items
- has_many :comments

##items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| information           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| postage_id            | integer    | null: false                    |
| delivery_area_id      | integer    | null: false                    |
| delivery_schedule_id  | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

##deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| delivery_area      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

##purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

##comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| items              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
