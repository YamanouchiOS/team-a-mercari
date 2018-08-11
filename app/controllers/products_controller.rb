class ProductsController < ApplicationController

  protect_from_forgery :except => [:create]

  def index
    pickup_id_1 = "1"
    pickup_id_2 = ""
    pickup_id_3 = ""

    @large_classes = LargeClass.pluck(:id, :name)
    @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id)
    @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)

  end

  def new
    @product = Product.new
    product_category = ProductCategory.new
    @product.product_images.build
    @product.product_category = product_category

    @large_classes = LargeClass.all
    @middle_classes = MiddleClass.all
    @small_classes = SmallClass.all
  end

  def show
    @product = Product.find(1)
  end

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
      product_category_attributes: [:large_class_id, :middle_class_id, :small_class_id]
      ).merge(user_id: current_user.id)
  end
end
