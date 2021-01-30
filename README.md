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
| users_name     | string | null: false |
| users_email    | string | null: false |
| users_password | string | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column               | Type   | Options                        |
| ------               | ------ | -----------                    |
| items_user_id        | string | null: false, foreign_key: true |
| items_name           | string | null: false                    |
| items_category       | string | null: false                    |
| items_condition      | string | null: false                    |
| items_text           | string | null: false                    |
| items_image          | string | null: false                    |
| items_area           | string | null: false                    |
| items_days           | string | null: false                    |
| items_price          | string | null: false                    |
| items_delivery_fee   | string | null: false                    |


### Association

- has_one :purchase_records
- belongs_to :users

## purchase_records テーブル

| Column                               | Type       | Options                        |
| ------                               | ---------- | ------------------------------ |
| purchase_records_user_id             | string     | null: false, foreign_key: true |
| purchase_records_items_id            | string     | null: false, foreign_key: true |
| purchase_records_user                | string     | null: false                    |
| purchase_records_items               | string     | null: false                    |

### Association

- has_one :addresses
- belongs_to :users

## addresses テーブル

| Column                         | Type       | Options                        |
| -------                        | ---------- | ------------------------------ |
| addressespurchase_records_id   | string     | null: false, foreign_key: true |
| addresses_prefectures          | string     | null: false                    |
| addresses_municipality         | string     | null: false                    |
| addresses_street               | string     | null: false                    |
| addresses_post                 | string     | null: false                    |
| addresses_phone                | string     | null: false                    |

### Association

- belongs_to :purchase_records
