class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def index
    @order_address = OrderAddress.new
    if @items.user_id == current_user.id || @items.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :address, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @items.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @items = Item.find(params[:item_id])
 end
end



     
