# README
## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|index要る？
|detail|text|null: false|#null: false要る？(入力必須？)
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|delivery_cost_id|references|null: false, foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|derivery_date_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|likes_count|integer|default: 0|


### Association
- belongs_to :user, counter_cache: :products_count
- belongs_to :category
- belongs_to :conditon
- belongs_to :delivery cost
- belongs_tp :prefecture
- belongs_to :delivery_date
- belongs_to :status
- has_many :comments
- has_many :likes, dependent: :destroy

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|#パスワード要る？
|products_count|string|default: 0|


### Association
- has_one :user_details
- has_one :self_introduction


## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false, add_index: true|
|first_name|string|unique: true, null: false|
|family_kana|string|unique: true, null: false|
|first_kana|string|unique: true, null: false|
|gender|string|unique: true, null: false|
|user_id|string|unique: true, null: false|


### Association


## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false, add_index: true|
|prefecture_id|string|unique: true, null: false|
|city|string|unique: true, null: false|
|house_number|string|unique: true, null: false|
|building_number|string|unique: true, null: false|
|tel|string|unique: true, null: false|
|user_id|string|unique: true, null: false|


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|

### Association


## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association


## derivery_costsテーブル

|Column|Type|Options|
|------|----|-------|
|derivery_cost|string|null: false|

### Association


## derivery_dateテーブル

|Column|Type|Options|
|------|----|-------|
|derivery_cost|string|null: false|

### Association


## product_statusテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association


## product_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|images|string|null: false|
|status|string|null: false|
|product_id|string|null: false|

### Association


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|images|string|null: false|
|status|string|null: false|
|product_id|string|null: false|

### Association


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
