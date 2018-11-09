# README

## brands

|Column|Type|Options|
|brand_name|text|add_index|
|category_l_id|integer|null: false|

### Association
- belongs_to :items

## items

|Column|Type|Options|
|item_name|string|null:false,add_index|
|price|integer|null:false|
|description|text|null: false|
|status|integer|null: false|
|shipping_fee|integer|null: false|
|arrive_date|integer|null: false|
|like_count|integer|null: false|
|category_s_id|integer|null: false|
|category_m_id|integer|null: false|
|category_l_id|integer|null: false|

### Association
- belongs_to :user
- has_many : likes
- has_many : images
- has_many : category_s
- has_mauy : category_m
- has_many : category_l
- has_one : trading_status
- has_one : brand

## users

|Column|Type|Options|
|nickname|string||
|email|string|null:false,add_index,unique: true|
|password|string|null:false,add_index,unique: true|
|profile|text||
|phone|string|null:false,unique: true|
|first_name|string|null:false|
|last_name|string|null:false|
|address|string|null:false|
|birthday|string|null:false|

### Association
- has_many : items
- has_many : likes
- has_one : destination

## deals

|Column|Type|Options|
|item_id|integer|null: false,foreingn_key: true|
|dealt_at|datetime|null: false|

### Association
- belongs_to :item
- belongs_to :user
## likes

|Column|Type|Options|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## images

|Column|Type|Options|
|image_url|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## comments

|Column|Type|Options|
|comment|string|null:false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## category_s

|Column|Type|Options|
|name|string|null: false|
|category_m_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category_m
- has_many :items

## category_m

|Column|Type|Options|
|name|string|null: false|
|category_l_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category_s
- belongs_to :category_l
- belongs_to :items

## category_l

|Column|Type|Options|
|name|string|null: false|

### Association
- has_many :catecory_m
- has_many :items
