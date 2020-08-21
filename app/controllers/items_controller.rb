class ItemsController < ApplicationController
  def index
    @tweets = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category, :status, :delivery_fee, :delivery_area, :delivery_days, :price, :image).merge(user_id: current_user.id)
  end

end

# def create
#   @item.save!
# end
