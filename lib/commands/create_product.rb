module Commands
  class CreateProduct
    attr_accessor :name, :description, :price, :category_id

    def initialize(category_id, name, description, price)
      @category_id = category_id
      @name = name
      @description = description
      @price = price

    end
  end
end