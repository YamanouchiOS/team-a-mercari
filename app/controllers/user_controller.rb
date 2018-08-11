class UserController < ApplicationController

  def edit
    @address = Address.find_by(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(introduction_params)
    redirect_to root_path
  end

  def show
  end

private

  def introduction_params
    params.require(:user).permit(:id, :nickname, address_attributes: [:id, :introduction])
  end

end
