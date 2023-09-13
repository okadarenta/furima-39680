class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase == nil
    @purchase_form = PurchaseForm.new
  else
    redirect_to root_path
  end
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    item_price = @item.price
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end




  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
end
end