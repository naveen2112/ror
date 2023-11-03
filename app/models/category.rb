class Category < ApplicationRecord
  has_many :product_writes

  validates :name, presence: true, uniqueness: true
end