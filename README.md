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


## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| favorite_id           | integer | null: false |
| have_pet_id           | integer | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |


### Association
has_many :cat_posts
has_many :cat_post_comments
has_many :dog_posts
has_many :dog_post_comments
has_many :vets
has_many :vet_comments
has_many :foods
has_many :foood_comments
has_many :chats
has_many :chat_comments

## cat_posts テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true |
| post_title           | string     | null: false                    |
| text                 | text       | null: false                    |


### Association
belongs_to :user
has_many    :cat_post_comments


## cat_post_comments テーブル
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| user_id          | references | null: false, foreign_key: true     |
| cat_post_id      | references | null: false, foreign_key: true     |
| comment          | text       | default: "", null: false           |

belongs_to :user
belongs_to :cat_post

## dog_posts テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true |
| post_title           | string     | null: false                    |
| text                 | text       | null: false                    |


### Association
belongs_to :user
has_many   :dog_post_comments


## dog_post_comments テーブル
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| user_id          | references | null: false, foreign_key: true     |
| dog_post_id      | references | null: false, foreign_key: true     |
| post             | references | null: false, foreign_key: true     |
| comment          | text       | default: "", null: false           |

belongs_to :user
belongs_to :dog_post

## vets テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| title            | string     | default: "", null: false       |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
has_many   :vet_comments

## vets_comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| vet_id           | references | null: false, foreign_key: true |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :vet

## foods テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| title            | text       | default: "", null: false       |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
has_many   :food_comments

## foods_comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| food_id          | references | null: false, foreign_key: true |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :food


## chats テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| room_name        | string     | null: false                    |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
has_many :chat_comments

## chat_comment テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| chat_id          | references | null: false, foreign_key: true |
| comment          | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :chat

