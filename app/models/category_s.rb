class CategoryS < ApplicationRecord
  belongs_to :category_m
  has_many :items
end
