# README

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|detail|text|null: false|
|price|unsigned_integer|null: false|
|user_id|references|null: false, foreign_key: true|
|product_category_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|delivery_cost|integer|null: false|
|prefecture|integer|null: false|
|delivery_date|date|null: false|
|status|integer|null: false|
|likes_count|integer|default: 0|

```
condition, delivery_cost, prefecture, delivery_date, statusは enum型で選択肢を保持
```

### Association
- belongs_to :user, counter_cache: :products_count
- belongs_to :category
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :product_images, dependent: :destroy

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|
|products_count|string|default: 0|
|family_name|string||
|first_name|string||
|family_kana|string||
|first_kana|string||
|gender|integer||
|introduction|text||

###Association
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :address

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false, add_index: true|
|prefecture|integer|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_number|string|null: false|
|tel|integer|unique: true, null: false|
|user_id|references|unique: true, null: false, foreign_key: true|

```
prefectureはenum型で選択肢を保持
○○市××町までユーザーに入力してもらう→Cityカラムに格納
１−１−１までユーザーに入力してもらう→street_numberに格納
```

###Association
- belongs_to :user
- accepts_nested_attributes_for :user

## product_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|large_class_id|references|null: false, foreign_key: true|
|middle_class_id|references|null: false, foreign_key: true|
|small_class_id|references|null: false, foreign_key: true|

### Association
- belongs_to :large_class
- belongs_to :middle_class
- belongs_to :small_class
- has_one :product

## large_classesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :categories, dependent: :destroy
- has_many :middle_classes, dependent: :destroy

## middle_classesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|large_class_id|references|null: false, foreign_key: true|

### Association
- has_many :categories, dependent: :destroy
- belongs_to :large_class
- has_many :small_classes, dependent: :destroy


## small_classesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|middle_classes_id|references|null: false, foreign_key: true|

### Association
- has_many :cateogries, dependent: :destroy
- belongs_to :middle_classes

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
|user_id|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, add_index: true|
|product_id|string|null: false, add_index: true|

### Association
- belongs_to :product, counter_cache: :likes_counts
- belongs_to :user
