class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

end

# def create
#   @item.save!
# end
