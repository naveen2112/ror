class AddCategoryToProductWrites < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_writes, :category, null: false, foreign_key: true
  end
end
