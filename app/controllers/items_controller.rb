class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
  end
  
  def edit
    if user_signed_in? && current_user == @item.user && @item.purchase.nil?
    else
      redirect_to root_path
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

 def destroy
  if @item.user == current_user
  @item.destroy
   redirect_to root_path
  else
    redirect_to root_path
 end
end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :condition_id, :user_id, :shipping_duration_id, :shipping_fee_burden_id, :category_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end