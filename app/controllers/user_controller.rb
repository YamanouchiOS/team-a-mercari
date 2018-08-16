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
  end

  def in_progress
  end

  def completed
  end

  def purchase
  end

  def purchased
  end

private

  def introduction_params
    params.require(:user).permit(:id, :nickname, address_attributes: [:id, :introduction])
  end

end
