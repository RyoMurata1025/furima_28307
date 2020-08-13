# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| information   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_area | string     | null: false                    |
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_num      | integer | null: false |
| card_month    | integer | null: false |
| card_year     | integer | null: false |
| security_code | integer | null: false |

## Association

- belongs_to :items
- has_one :buyer_address

## messages テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal      | string  | null: false |
| prefectures | string  | null: false |
| city        | string  | null: false |
| address     | string  | null: false |
| building    | string  |             |
| phone_num   | integer | null: false |

## Association

- belongs_to :purchases

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
