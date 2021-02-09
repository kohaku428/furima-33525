class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_orders = UserOrders.new
  end
   
  def create
    @item = Item.find(params[:item_id])
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
  params.require(:user_orders).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
   amount: @item.price,
   card: order_params[:token],
   currency: 'jpy'
    )
 end
end
