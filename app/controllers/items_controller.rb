class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order('id DESC')
  end
  
  def new
    @item = Item.new
  end

    def create
    @item = Item.new(items_params)

    if @item.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
 
private 
def items_params
  params.require(:item).permit(:image, :name,:text,:category_id,:item_status_id,:item_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:price).merge(user_id: current_user.id)
end
end

