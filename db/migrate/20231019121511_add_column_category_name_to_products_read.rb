class AddColumnCategoryNameToProductsRead < ActiveRecord::Migration[7.0]
  def change
    add_column :product_reads, :category_name, :string
  end
end
