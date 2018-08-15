class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buyer = User.includes(:address).find(@product.buyer.id)
    @seller = User.find(@product.user_id)
    @user = User.find(current_user)
  end
end
