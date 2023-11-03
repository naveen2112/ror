class ProductsController < ApplicationController
  require './lib/commands/create_product'
  require './lib/command_handlers/create_product'
  require './lib/commands/delete_product'
  require './lib/command_handlers/delete_product'
  require './lib/commands/update_product'
  require './lib/command_handlers/update_product'
  require 'benchmark'
  before_action :set_product_write, :set_product, only: %i[ show edit update destroy ]
  before_action :set_category

  def index
    @write = false
    if params[:read_search].present?
      @search_time = Benchmark.realtime do
        @search_result = Product.search(params[:read_search])
      end
      @products = @search_result.paginate(page: params[:page], per_page: 25)
    elsif params[:write_search].present?
      @write = true
      @search_time = Benchmark.realtime do
        @search_result = ProductWrite.write_search(params[:write_search])
      end
      @products = @search_result.paginate(page: params[:page], per_page: 25)
    else
      @products = Product.where(category_name: @category.name).paginate(page: params[:page], per_page: 25)
    end
  end

  def show

  end

  def new
    @product_write = ProductWrite.new
  end

  def create
    command = Commands::CreateProduct.new( @category.id, params[:product_write][:name], params[:product_write][:description], params[:product_write][:price])
    execute(command)
    redirect_to category_products_path(@category), notice: 'Product created successfully.'
  end

  def edit
  end

  def update
    command = Commands::UpdateProduct.new(@product_write.id, params[:product_write][:name], params[:product_write][:description], params[:product_write][:price], @category.id)
    execute(command)
    redirect_to category_products_path(@category), notice: 'Product updated successfully.'
  end

  def destroy
    command = Commands::DeleteProduct.new(@product_write.id)
    execute(command)
    redirect_to category_products_path(@category), notice: "Product was successfully destroyed."
  end


  private

  def set_product_write
    @product_write = ProductWrite.find(params[:product_id])
  end

  def set_product
    @product = Product.find_by(product_id: params[:product_id])
  end

  def set_category
    @category = Category.find_by(id:params[:category_id])
  end

  def product_params
    params.require(:product_write).permit(:name, :description, :price, :category_id)
  end

end
