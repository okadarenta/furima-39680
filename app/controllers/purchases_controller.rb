class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  def new
    @purchase_form = PurchaseForm.new
    render :index
  end 

def purchase_params
  params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
end
end