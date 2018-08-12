class AddressesController < ApplicationController

  before_action :set_address, only: [:edit, :update]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    each_cat = [@large_classes = LargeClass.pluck(:id, :name), @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id), @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)]
  end

  def update
    @address.update(address_params)
    redirect_to user_path(current_user.id)
  end

private

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :street_number, :building_number, :phone_number, :family_name, :first_name, :family_kana, :first_kana).merge(user_id: current_user.id)
  end

end
