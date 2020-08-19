FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"abcde@gmail.com"}
    password              {"a0000000"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"19930109"}
  end
end