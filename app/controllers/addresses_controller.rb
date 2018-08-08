class AddressesController < ApplicationController

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
  end

  def update
  end

  def show
  end

private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :street_number, :building_number, :phone_number, :family_name, :first_name, :family_kana, :first_kana, :introduction).merge(user_id: current_user.id)
  end

end
