module CommandHandlers
  class UpdateProduct
  require './lib/events/product_updated'
  require './lib/denormalizers/product_updated'

  def call(command)
    product = ProductWrite.find(command.product_id)
    return unless product

    product.update(
      name: command.name,
      description: command.description,
      price: command.price,
      category_id: command.category_id
    )

    stream_name = "update_product"
    event = Events::ProductUpdated.new(data: {
      product_id: command.product_id,
      name: command.name,
      description: command.description,
      price: command.price,
      category_id: command.category_id
    })

    Rails.configuration.event_store.publish(event, stream_name: stream_name)
  end
  end
end