class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :price, type: Integer
  field :category_name, type: String
  field :product_id, type: Integer

  def self.search(query)
    criteria = all
    if query.present?
      criteria = criteria.or(
        { name: /#{query}/i },
        { description: /#{query}/i },
        { price: query.to_i },
        { category_name: /#{query}/i }
      )
    end
    criteria
  end

end
