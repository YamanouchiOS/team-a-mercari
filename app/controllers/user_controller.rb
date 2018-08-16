class UserController < ApplicationController

  def signout
  end

  def edit
    @address = Address.find_by(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(introduction_params)
    redirect_to user_path(current_user.id)
  end

  def show
  end

  def listening
    @products = Product.where('user_id = ? and status = ?',current_user.id, 0)
  end

  def in_progress
    @products = Product.where('user_id = ? and (status = ? or status = ? or status = ?)',current_user.id, 1, 2, 3)
  end

  def completed
    @products = Product.where('user_id = ? and status = ?',current_user.id, 4)
  end

  def purchase
    @products = Product.where('buyer_id = ? and (status = ? or status = ? or status = ?)',current_user.id, 1, 2, 3)
  end

  def purchased
    @products = Product.where('buyer_id = ? and status = ?',current_user.id, 4)
  end

private

  def introduction_params
    params.require(:user).permit(:id, :nickname, address_attributes: [:id, :introduction])
  end

end
