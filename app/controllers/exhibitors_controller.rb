class ExhibitorsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = Product.where(user_id: params[:id])
  end

end
