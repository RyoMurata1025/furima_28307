class ItemsController < ApplicationController
  def index
    @tweets = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category, :status, :delivery_fee, :delivery_area, :delivery_days, :price, :user_id)
  end
end

# def create
#   @item.save!
# end
