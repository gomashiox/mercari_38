class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :seller_deals, class_name: "Deal", foreign_key: "seller_id", dependent: :destroy
  has_many :buyer_deals, class_name: "Deal", foreign_key: "buyer_id", dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :deals
  has_many :deals_messages
  has_many :comments, dependent: :destroy
  has_many :selling_items, -> { where("buyer_id is NULL") }, class_name: "Item", foreign_key: "seller_id"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, class_name: "Item", foreign_key: "seller_id"
  has_many :bought_items, class_name: "Item", foreign_key: "seller_id"
end
