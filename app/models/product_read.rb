class ProductRead < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :read_search,
                  against: %i[name description price category_name],
                  using: { tsearch: { prefix: true } }
end
