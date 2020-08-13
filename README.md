# テーブル設計

## users テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| nickname         | string  | null: false                    |
| email            | string  | null: false                    |
| password         | string  | null: false                    |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| birth_year       | integer | null: false, foreign_key: true |
| birth_month      | integer | null: false, foreign_key: true |
| birth_day        | integer | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| information   | text       | null: false                    |
| category      | integer    | null: false, foreign_key: true |
| status        | integer    | null: false, foreign_key: true |
| delivery_fee  | integer    | null: false, foreign_key: true |
| delivery_area | integer    | null: false, foreign_key: true |
| delivery_days | integer    | null: false, foreign_key: true |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buyers

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association

- belongs_to :users
- belongs_to :items
- has_one :buyer_addresses

## buyer_addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal      | string     | null: false                    |
| prefectures | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone_num   | integer    | null: false                    |
| buyer       | references | null: false, foreign_key: true |

## Association

- belongs_to :buyers

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
