class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buyer = User.includes(:address).find(@product.buyer.id)
  end
end
