class ProductsController < ApplicationController

  protect_from_forgery :except => [:create]

  def index
      @products =Product.find(1)
  end

  def new
    @product = Product.new
    @large_classes = LargeClass.all
  end

  def show
    @product = Product.find_by(1)

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to action: :new, alert: 'New product was unsuccessfully created'
    end
  end


  private

  def product_params
    params.require(:product).permit(
      :name,
      :detail,
      :price,
      :user_id,
      :condition,
      :delivery_cost,
      :prefecture,
      :delivery_date,
      product_images_attributes: [:image, :status],
      # product_categories_attributes: [:large_class_id, :middle_class_id, :small_class_id]
      )
  end
end
