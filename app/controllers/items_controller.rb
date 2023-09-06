class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    if current_user
      @item = current_user.items.build(item_params)
      if @item.save
        redirect_to root_path
      else
      render :new, status: :unprocessable_entity
    end
  end
end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :condition_id, :user_id, :shipping_duration_id, :shipping_fee_burden_id, :category_id, :prefecture_id, :image)
  end
end