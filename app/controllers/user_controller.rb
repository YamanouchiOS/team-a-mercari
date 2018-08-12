class UserController < ApplicationController

  def edit
    @address = Address.find_by(user_id: current_user.id)
    @user = User.find(current_user.id)
    each_cat = [@large_classes = LargeClass.pluck(:id, :name), @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id), @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)]
  end

  def update
    @user = User.find(current_user.id)
    @user.update(introduction_params)
    redirect_to user_path(current_user.id)
  end

  def show
    each_cat = [@large_classes = LargeClass.pluck(:id, :name), @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id), @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)]
  end

private

  def introduction_params
    params.require(:user).permit(:id, :nickname, address_attributes: [:id, :introduction])
  end

end
