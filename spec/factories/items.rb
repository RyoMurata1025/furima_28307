FactoryBot.define do
  factory :item do
    name          {"商品名"}
    information   {"商品の説明"}
    category_id      {"1"}
    status_id        {"1"}
    delivery_fee_id  {"1"}
    delivery_area_id {"1"}
    delivery_days_id {"1"}
    price         {"300"}
    association :user
  end
end
