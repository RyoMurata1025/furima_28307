class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.new(price: buyer_params[:price])
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_XXXXXXXX"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: buyer_params[:price],  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
