class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
@item = Itmes.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

  def item_params
    params.require(:item).permit(:title,:text,:genre_id,:item_condition_id,:item_prefecture_id,:item_shipping_id,:scheduled_delivery_id)
  end
end