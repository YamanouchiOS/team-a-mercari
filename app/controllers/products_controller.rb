class ProductsController < ApplicationController
  def index

  end

  def new
    @large_classes = LargeClass.all
  end
end
