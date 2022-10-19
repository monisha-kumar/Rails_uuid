class Article < ApplicationRecord
  validates :title,uniqueness: true
  validates :description,uniqueness: true
end
