require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do

  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  context '商品購入機能の正常系テストコード' do
    it "購入に必要な情報が入力されていれば情報が登録される" do
      expect(@buyer_address).to be_valid
      end
  end

  context '商品購入機能の異常系テストコード' do
    it "郵便番号が空だと登録できない" do
      @buyer_address.postal_code = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end

    it "郵便番号にハイフンが無いと登録できない" do
      @buyer_address.postal_code = "1234567"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

    it "都道府県が空だと登録できない" do
      @buyer_address.prefecture_id = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
    
    it "市区町村が空だと登録できない" do
      @buyer_address.city = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end

    it "番地が空だと登録できない" do
      @buyer_address.house_number = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
    
    it "電話番号が空だと登録できない" do
      @buyer_address.phone_number = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
    
    it "郵便番号が12桁以上だと登録できない" do
      @buyer_address.phone_number = "111111111111111111"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

  end
end
