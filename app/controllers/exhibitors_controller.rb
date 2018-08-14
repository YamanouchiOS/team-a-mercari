class ExhibitorsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = Product.where(user_id: params[:id])
    @product_all = @products.count
  end

end
