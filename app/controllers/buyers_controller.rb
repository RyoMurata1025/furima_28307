class BuyersController < ApplicationController

  before_action :move_to_index

  def index
    @buyer = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    # @user = User.find(params[:user_id])

    @buyer = BuyerAddress.new(buyer_params) 
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def buyer_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? 
      orner_sign
    else
      redirect_to user_session_path
    end
  end

  def orner_sign
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
