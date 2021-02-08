class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_orders = UserOrders.new
  end
   
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @user_orders = UserOrders.new(order_params)
   if @user_orders.valid?
     @user_orders.save
     redirect_to root_path
   else
     render action: :index
   end
  end

 private

 def order_params
  params.require(:user_orders).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone,).merge(user_id: current_user.id, item_id: params[:item_id],)
 end

end
