FactoryBot.define do
  factory :buyer_address do
    # buyer_id        {"2"}
    postal_code     {"123-4567"}
    prefecture_id   {"20"}
    city            {"テスと市"}
    house_number    {"テスと町1-２ー3"}
    building_name   {"はいつコーポレート123"}
    phone_number    {"0120111111"}
    token           {"token"}
    # binding.pry
    
    # association :buyer  f.objectで使用したbuyer_address.rbではそんなアソシエーション組んでいない
    # item_id         {create(:item).id}
   

    # item_id         {create(:item).id}

    # user_id         {create(:user).id}
  end

  # factory :buyer do
  #   item_id         {"1"}
  #   user_id         {"1"}
  #   association :item
  #   association :user
  # end


end
