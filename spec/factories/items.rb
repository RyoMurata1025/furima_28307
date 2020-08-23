FactoryBot.define do
  factory :item do
    name          {"商品名"}
    information   {"商品の説明"}
    category      {"1"}
    status        {"1"}
    delivery_fee  {"1"}
    delivery_area {"1"}
    delivery_days {"1"}
    price         {"300"}
    association :user
  end
end
