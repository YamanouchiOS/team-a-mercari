# README
## 都道府県情報テーブル

|Column|Type|Options|
|------|----|-------|
||references|null: false, foreign_key: true|

### Association


## productテーブル

|Column|Type|Options|
|------|----|-------|
|name|references|null: false, foreign_key: true|
|detail|references|null: false, foreign_key: true|
|price|text|
|category_id|string|
|condition_id|string|
|derivery_cost_id|string|
|prefecture_id|string|
|derivery_date_id|string|
|status_id|string|
|likes_count|string|


### Association


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|


### Association


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

