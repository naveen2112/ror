module CommandHandlers
  class DeleteProduct
  require './lib/events/product_deleted'
  require './lib/denormalizers/product_deleted'

    def call(command)
      product = ProductWrite.find(command.product_id)
      return unless product

      product.destroy
      stream_name = "delete_product"
      event = Events::ProductDeleted.new(data: { id: command.product_id })
      Rails.configuration.event_store.publish(event, stream_name: stream_name)
    end
  end
end