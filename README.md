# README FOR CUTIE PIES


## Overview
* CUTIE PIES to share your pets pictures and recommendation of items, foods, vets etc..and also can ask your pets' problems to live healthy and be happy together. 

## Description
* Need to make your own account to use CUTIE PIES, just put your nickname( the other user can see your nickname), email address, password and your pet info as well if you have a pet.
Then, share your pictures or just look around other cats or dog or talk to someone about your problems or life style whatever you feel like.
Just click your nickname on the header when you want to change your account information, also can delete your account on the page but you can not undo after delete it, please make your account again if you want it again.
* You can add your comments when you want to talk to the poster and the newest comment is on the top of the list.
* Share your recommendation of items for your pets and add Amazon URL if they have it to check the item easily but it's not necessary.
* You can check your pictures and recommendation that you posted from your account page which called "My Page". Transition to My Page from your nickname on the header or posted you did before and also you can check the other user's My Page.

### Ruby version
ruby 2.6.5
Rails 6.0.3.2

### Deployed URL
* https://cutie-pies.herokuapp.com/
* test user account : kotori@gmail.com / pass: kotori123

## users table

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
has_many :items
has_many :items_comments
has_many :chats
has_many :chat_comments

## cat_posts table

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true |
| cat_post_title       | string     | null: false                    |
| cat_post_text        | text       | null: false                    |


### Association
belongs_to :user
has_many    :cat_post_comments


## cat_post_comments table
| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| user_id          | references | null: false, foreign_key: true     |
| cat_post_id      | references | null: false, foreign_key: true     |
| cat_post_comment | text       | default: "", null: false           |

belongs_to :user
belongs_to :cat_post

## items table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| items_title      | string     | default: "", null: false       |
| items_text       | text       | default: "", null: false       |
| items_link       | text       |                                |

### Association
belongs_to :user
has_many   :items_comments

## items_comments table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| items_comment    | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :items

## vets table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| vet_title        | string     | default: "", null: false       |
| vet_text         | text       | default: "", null: false       |

### Association
belongs_to :user
has_many   :vet_comments

## vets_comments table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| vet_id           | references | null: false, foreign_key: true |
| vet_comment      | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :vet

## chats table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| room_name        | string     | null: false                    |
| chat_text        | text       | default: "", null: false       |

### Association
belongs_to :user
has_many :chat_comments

## chat_comment table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| chat_id          | references | null: false, foreign_key: true |
| chat_comment     | text       | default: "", null: false       |

### Association
belongs_to :user
belongs_to :chat


## Background of this web application 
* Having a pet in Japan is really hard because lots of places aren't allowed pet and people have never had a pet so, don’t know how to have them and care of them at the first time and there is no place to talk or ask about it. But I'm convinced you and your cuties could be happier if you know great items or foods or vet, etc... 
And I’ve been thinking that would be great if I make the place for people who love animals and want to share the opinions and recommendation to make the other people’s happy.

## Author
Ayumi Uchimura
