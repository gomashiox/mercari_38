class CategoryL < ApplicationRecord
  has_many :category_ms
  has_many :items
end
