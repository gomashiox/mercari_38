class Size < ApplicationRecord
  belongs_to :category_s
  has_many :items
end
