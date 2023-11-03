module Denormalizers
  class ProductCreated
    def call(event)
        category = Category.find(event.data[:category_id])
        Product.create(
          category_name: category.name ,
          product_id: event.data[:id],
          name: event.data[:name],
          description: event.data[:description],
          price: event.data[:price]
        )
    end
  end
end