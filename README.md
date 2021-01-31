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
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date | null: false |
| email           | string | null: false unique: true |
| encrypted_password        | string | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column              | Type       | Options                        |
| ------              | ------     | -----------                    |
| user          | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| text          | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| delivery_fee_id  | integer     | null: false                    |


### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column                 | Type       | Options                        |
| ------                 | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column                    | Type           | Options                        |
| -------                   | ----------     | ------------------------------ |
| purchase_record | references     | null: false, foreign_key: true |
| prefecture_id   | integer        | null: false                    |
| municipality    | string         | null: false                    |
| street          | string         | null: false                    |
| buildings       | string         |                                |
| post            | string         | null: false                    |
| phone           | string         | null: false                    |

### Association

- belongs_to :purchase_record
