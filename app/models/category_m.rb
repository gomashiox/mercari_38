class CategoryM < ApplicationRecord
  has_many :category_s
  belongs_to :category_l
  has_many :items
end
