require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が含まれていないと登録できない" do
      user = FactoryBot.build(:user)
      user.email = "abcdegmail.com"
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上でないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "00000"
      user.password_confirmation ="00000"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合でないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "12345678"
      user.password_confirmation ="12345678"
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは二回入力する" do
      user = FactoryBot.build(:user)
      user.password_confirmation ="aaaaaaa0"
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字が空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "名字は全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = "yamada"
      user.valid?
      expect(user.errors.full_messages).to include("Family name is invalid")
    end
    it "名前が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "名前は全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = "taro"
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "名字のフリガナが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "名字は全角（カタカナでないと登録できない）" do
      user = FactoryBot.build(:user)
      user.family_name_kana = "山だ"
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "名前のフリガナが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名前のフリガナは全角（カタカナでないと登録できない）" do
      user = FactoryBot.build(:user)
      user.first_name_kana = "太ろう"
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it "生年月日が空では登録できない" do
      user = FactoryBot.build(:user)
      user.birth_day = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end