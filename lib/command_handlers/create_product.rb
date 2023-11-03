module CommandHandlers
  class CreateProduct
    require './lib/events/product_created'
    require './lib/denormalizers/product_created'

    def call(command)
      product = ProductWrite.create(name: command.name, description: command.description, price: command.price, category_id: command.category_id)
      stream_name = "create_product#{product.id}"
      event = Events::ProductCreated.new(data: { id: product.id, name: command.name, description: command.description, price: command.price, category_id: command.category_id })
      Rails.configuration.event_store.publish(event, stream_name: stream_name)
    end
  end
end