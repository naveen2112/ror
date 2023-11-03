class AddIndexToCategoryNameOnProductReads < ActiveRecord::Migration[7.0]
  def change
    add_index :product_reads, :category_name
  end
end
