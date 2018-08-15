class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :buy, :first_update]
  protect_from_forgery :except => [:create]

  def index
    @pickup1 = Product.fetch_pickup_categories(1)
    @pickup2 = Product.fetch_pickup_categories(2)
    @pickup3 = Product.fetch_pickup_categories(3)
  end

  def new
    @product = Product.new
    product_category = ProductCategory.new
    @product.product_images.build
    @product.product_category = product_category
  end

  def show
    @product = Product.includes(:user).find(params[:id])
    @products = Product.where(user_id: @product.user_id).where.not(id: params[:id])
    @productcategory = ProductCategory.where(product_id: params[:id])

    @large_classes = LargeClass.pluck(:id, :name)
    @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id)
    @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)
    @comments = @product.comments.order("created_at ASC")
    @comment = Comment.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to action: :new, alert: 'New product was unsuccessfully created'
    end
  end

  def buy
    @user = User.includes(:address).find(current_user.id)
  end

  def first_update
    if @product.update(first_update_params)
      redirect_to action:'perchased'
    else
      render :buy
    end
  end

  def perchased
    @product = Product.find(params[:id])
    @buyer = User.includes(:address).find(@product.buyer.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

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

  def first_update_params
    params.permit(:buyer_id, :status)
  end
end
