module Denormalizers
  class ProductUpdated
    def call(event)
        category = Category.find_by(id: event.data[:category_id])
        product = Product.find_by(product_id: event.data[:product_id])

        return unless product

        product.update(
          name: event.data[:name],
          description: event.data[:description],
          price: event.data[:price],
          category_name: category.name,
          product_id: event.data[:product_id]
        )
    end
  end
end