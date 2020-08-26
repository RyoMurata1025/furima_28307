class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def destroy
    @item.destroy
    if @item.valid?
      redirect_to root_path
    else
      render "show"
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render "edit"
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
