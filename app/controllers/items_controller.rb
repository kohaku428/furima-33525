class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end
  private
  def item_params
    params.require(:item).permit(:category_id, :image, :condition_id, :cost_id, :day_id, :item_name, :description, :price).merge(user_id: current_user.id)
  end
end
