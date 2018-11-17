# README

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|limit: 20|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile|text|limit: 1000|
|phone_number|string|null:false,unique: true|
|first_name|string|null: false, limit: 35|
|last_name|string|null: false, limit: 35|
|address|string|null: false|
|birthday|string|null: false|
|seller_id|integer
|buyer_id|integer

### Association
- has_many : seller_deals, class_name: "Deal", foreign_key: seller_id, dependent: :destroy
- has_many : buyer_deals, class_name: "Deal", foreign_key: buyer_id, dependent: :destroy
- has_many : items, dependent: :destroy
- has_many : likes, dependent: :destroy
- has_many : deals
- has_many : deals_messages
- has_many : comments, dependent: :destroy
- has_many : selling_items, : :{ where("buyer_id is NULL") }, class_name "Item", foreign_key: "seller_id"
- has_many : sold_items, : :{ where("buyer_id is not NULL") }, class_name "Item", foreign_key: "seller_id"
- has_many : bought_items, class_name "Item", foreign_key: "seller_id"

## category_l

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category_ms
- has_many :items

## category_m

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_l_id|reference|null: false, foreign_key: true|

### Association
- has_many :category_s
- belongs_to :category_l
- has_many :items

## category_s

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_m_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :category_m
- has_many :items

## items

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 60, add_index|
|price|integer|null: false|
|condition|string|null: false|
|description|text|null: false, limit: 1000|
|shipping_fee|string|null: false|
|arrived_date|string|null: false|
|like_count|integer|null: false|
|category_s_id|references|null: false, foreign_key: true|
|category_m_id|references|null: false, foreign_key: true|
|category_l_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|seller_id|integer|
|buyer_id|integer|


### Association
- belongs_to :seller_deal, class_name: "User", foreign key: "seller_id"
- belongs_to :buyer_deal, class_name "User", foreign key: "buyer_id"
- has_many : likes, dependent: :destroy
- has_many : images, dependent: :destroy
- belongs_to : category_s
- belongs_to : category_m
- belongs_to : category_l
- has_one : deal
- belongs_to : brand
- belongs_to : size

## deals

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|dealt_at|datetime|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :seller, class_name: "User",foreign_key: :seller_id
- belongs_to :buyer, class_name: "User",foreign_key: :buyer_id
- has_many : deal_messages, dependent: :destroy

## brands

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|category_l_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## likes

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## images

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## comments

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false, limit: 1000|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## sizes

|Column|Type|Options|
|------|----|-------|
|category_s_id|string|null: false|
|name|string|

### Association
- belongs_to :category_s
- has_many :items

## deal_messages

|Column|Type|Options|
|------|----|-------|
|messages|text|null: false, limit: 1000|
|deal_id|references|null: false|
|user_id|references|null: false|

### Association
- belongs_to : deal
- belongs_to : user