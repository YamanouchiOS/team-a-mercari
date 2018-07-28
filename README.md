# README

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|detail|text|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|product_category_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|delivery_cost|integer|null: false|
|prefecture|integer|null: false|
|delivery_date|integer|null: false|
|status|integer|null: false|
|likes_count|integer|default: 0|

```
condition, delivery_cost, prefecture, delivery_date, statusは enum型で選択肢を保持
```

### Association
- belongs_to :user, counter_cache: :products_count
- belongs_to :category
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
|family_name|string||
|first_name|string||
|family_kana|string||
|first_kana|string||
|gender|integer||
|postal_code|integer||
|prefecture|integer||
|city|string||
|street_number|string||
|building_number|string||
|tel|integer|unique: true|
|introduction|text||

```
prefectureはenum型で選択肢を保持
○○市××町までユーザーに入力してもらう→Cityカラムに格納
１−１−１までユーザーに入力してもらう→street_numberに格納
```

###Association
- has_many :products
- has_many :likes


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
- has_many :categories
- has_many :middle_classes

## middle_classesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|large_class_id|references|null: false, foreign_key: true|

### Association
- has_many :categories
- belongs_to :large_class
- has_many :small_classes


## small_classesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|middle_classes_id|references|null: false, foreign_key: true|

### Association
- has_many :cateogries
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
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|product_id|string|null: false|

### Association
- belongs_to :product, counter_cache: :likes_counts
- belongs_to :user
