module Commands
  class DeleteProduct
    attr_accessor :product_id

    def initialize(product_id)
      @product_id = product_id
    end

  end
end