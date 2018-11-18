class Item < ApplicationRecord
  belongs_to :seller_deal, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer_deal, class_name: "User", foreign_key: "buyer_id"
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :category_s
  belongs_to :category_m
  belongs_to :category_l
  has_one :deal
  belongs_to :brand
  belongs_to :size
end
