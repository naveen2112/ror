module Commands
  class UpdateProduct
    attr_accessor :product_id, :name, :description, :price, :category_id

    def initialize(product_id, name, description, price, category_id)

      @category_id = category_id
      @product_id = product_id
      @name = name
      @description = description
      @price = price

    end
  end
end