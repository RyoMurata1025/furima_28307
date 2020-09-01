FactoryBot.define do
  factory :buyer_address do
    postal_code     {"123-4567"}
    prefecture_id   {"20"}
    city            {"テスと市"}
    house_number    {"テスと町1-２ー3"}
    building_name   {"はいつコーポレート123"}
    phone_number    {"0120111111"}
    token           {"token"}
  end

end
