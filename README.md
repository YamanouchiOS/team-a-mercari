# README

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|detail|text|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|delivery_cost|references|null: false, foreign_key: true|
|prefecture|references|null: false, foreign_key: true|
|delivery_date|references|null: false, foreign_key: true|
|status|references|null: false, foreign_key: true|
|likes_count|integer|default: 0|

```
condition, delivery_cost, prefecture, delivery_date, statusは enum型で選択肢を持っておく
```

### Association
- belongs_to :user, counter_cache: :products_count
- belongs_to :category
- belongs_to :condition
- belongs_to :delivery_cost
- belongs_to :prefecture
- belongs_to :delivery_date
- belongs_to :status
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :product_images

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|
|products_count|string|default: 0|


### Association
- has_one :user_details
- has_one :self_introduction
- has_one :address


## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|gender|integer|null: false|
|user_id|references|unique: true, null: false, foreign_key: true|


### Association
- belongs_to :user

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false, add_index: true|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|street_number|string|null: false|
|building_number|string|null: false|
|tel|integer|unique: true, null: false|
|user_id|references|unique: true, null: false, foreign_key: true|

```
○○市××町までユーザーに入力してもらう→Cityカラムに格納
１−１−１までユーザーに入力してもらう→street_numberに格納
```

### Association
- belongs_to :user

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category-1_id|references|null: false, foreign_key: true|
|category-2_id|references|null: false, foreign_key: true|
|category-3_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category-1
- belongs_to :category-2
- belongs_to :category-3
- has_one :product

## category-1sテーブル

|Column|Type|Options|
|------|----|-------|
|category-1_name|string|null: false, unique: true|

### Association
- has_many :categories
- has_many :category-2

## category-2sテーブル

|Column|Type|Options|
|------|----|-------|
|category-2_name|string|null: false, unique: true|
|category-1_id|references|null: false, foreign_key: true|

### Association
- has_many :categories
- belongs_to :category-1
- has_many :category-3


## category-3sテーブル

|Column|Type|Options|
|------|----|-------|
|category-3_name|string|null: false, unique: true|
|category-2_id|references|null: false, foreign_key: true|

### Association
- has_many :cateogries
- belongs_to :category-2

## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|images|string|null: false|
|status|integer|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|product_id|string|null: false|

### Association
- belongs_to :product, counter_cache: :likes_couns
- belongs_to :user

## self_introductionsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
