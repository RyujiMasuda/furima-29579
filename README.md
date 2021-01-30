# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| users_nickname        | string | null: false |
| users_last_name       | string | null: false |
| users_first_name      | string | null: false |
| users_last_name_kana  | string | null: false |
| users_first_name_kana | string | null: false |
| users_birthday        | string | null: false |
| users_email           | string | null: false |
| users_password        | string | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | -----------                    |
| items_user          | references | null: false, foreign_key: true |
| items_name          | string     | null: false                    |
| items_category_id   | integer    | null: false                    |
| items_condition_id  | integer    | null: false                    |
| items_text          | text       | null: false                    |
| items_prefecture_id | integer    | null: false                    |
| items_day_id        | integer    | null: false                    |
| items_price         | integer    | null: false                    |
| items_delivery_fee  | string     | null: false                    |


### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column                 | Type       | Options                        |
| ------                 | ---------- | ------------------------------ |
| purchases_record_user  | references | null: false, foreign_key: true |
| purchases_record_item  | references | null: false, foreign_key: true |

### Association

- has_one :addresse
- belongs_to :user

## addresses テーブル

| Column                    | Type           | Options                        |
| -------                   | ----------     | ------------------------------ |
| addresses_purchase_record | references     | null: false, foreign_key: true |
| addresses_prefecture_id   | integer        | null: false                    |
| addresses_municipality    | string         | null: false                    |
| addresses_street          | string         | null: false                    |
| addresses_buildings       | string         |                                |
| addresses_post            | string         | null: false                    |
| addresses_phone           | string         | null: false                    |

### Association

- belongs_to :purchase_record
