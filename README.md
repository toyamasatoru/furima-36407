#テーブル設計

##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :purchases
- has_many :items
- has_one :card
- has_many :comments

##items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| information        | text       | null: false |
| category           | integer    | null: false |
| status             | integer    | null: false |
| postage            | integer    | null: false |
| delivery_area      | integer    | null: false |
| price              | integer    | null: false |
| user               | references |             |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

##deliveries テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| delivery_area      | integer    | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| building           | string     |             |
| phone              | string     | null: false |
| purchase           | references |             |

### Association

- belongs_to :purchase

##purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references |             |
| items              | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

##cards テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| card_id            | string     | null: false |
| card_deadline      | string     | null: false |
| card_security      | string     | null: false |
| user               | references |             |

### Association

- belongs_to :user

##comments テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| text               | text       |             |
| user               | references |             |
| items              | references |             |

### Association

- belongs_to :user
- belongs_to :items
