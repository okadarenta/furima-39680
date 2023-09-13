class ShippingAddressesController < ApplicationController
  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to root_path
    else
      render :new, status:  :unprocessable_entity
    end
  end
  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
