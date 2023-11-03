module Denormalizers
  class ProductDeleted
    def call(event)
        product_read = Product.where(product_id: event.data[:id])
        product_read.destroy
    end
  end
end