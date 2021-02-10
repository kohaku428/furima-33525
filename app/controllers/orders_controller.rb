class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :sold_out]
  before_action :sold_out
  def index
    @user_orders = UserOrders.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @user_orders = UserOrders.new(order_params)
    if @user_orders.valid?
      pay_item
      @user_orders.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_orders).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
