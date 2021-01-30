class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_tweet, only: [:edit, :show, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :image, :condition_id, :cost_id, :day_id, :item_name, :description, :price,
                                 :region_id).merge(user_id: current_user.id)
  end
  def set_tweet
    @item = Item.find(params[:id])
  end
end
