class OrdersController < ApplicationController
  before_action :move_to_signed_in
  
  def index
    @order_address = OrderAddress.new
    @items = Item.find(params[:item_id])
    if @items.user_id == current_user.id
      redirect_to root_path
    end

    if @items.order != nil
      redirect_to root_path
    end
    end

  def create
    @items = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_5cb01d6322dc1c5a65ab2946"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @items.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end



     
