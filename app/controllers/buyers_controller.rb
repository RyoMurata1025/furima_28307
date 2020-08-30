class BuyersController < ApplicationController
  def index
    @buyer = Buyer.new
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
    Payjp.api_key = "sk_test_43eedc00d8b4cf0d98d95377"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
