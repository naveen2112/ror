class ProductWrite < ApplicationRecord
  include PgSearch::Model
  belongs_to :category
  validates :name, :description, :price, presence: true

  pg_search_scope :write_search,
                  against: %i[name description price],
                  associated_against: { category: %i[ name ]},
                  using: { tsearch: { prefix: true } }
end
