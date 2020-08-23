require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品機能の正常系テストコード' do
    it "出品に必要な情報が入力されていれば情報が登録される" do
    expect(@item).to be_valid
    end
  end

  context '商品出品機能の異常系テストコード' do
    it "商品名が空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空では登録できない" do
      @item.information = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
    end
    it "カテゴリーが空では登録できない" do
      @item.category = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空では登録できない" do
      @item.status = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料の負担が空では登録できない" do
      @item.delivery_fee = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it "発送元の地域が空では登録できない" do
      @item.delivery_area = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    it "発送までの日数が空では登録できない" do
      @item.delivery_days = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank")
    end
    it "販売価格が空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が300円より少ないと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "販売価格が9999999円より多いと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
