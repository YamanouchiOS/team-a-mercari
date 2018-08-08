class ProductsController < ApplicationController
  def index
    @products =Product.find(1)
  end

  def new
    @large_classes = LargeClass.all
  end

  def show
    @product = Product.find_by(1)
  end
end
