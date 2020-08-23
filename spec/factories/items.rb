FactoryBot.define do
  factory :item do
    name          {"商品aA1１"}
    information   {"この商品はアメリカ(Usa)産の3３"}
    category      {1}
    status        {1}
    delivery_fee  {1}
    delivery_area {1}
    delivery_days {1}
    price         {"300"}
  end
end
