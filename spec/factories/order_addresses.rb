FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    item_prefecture_id {2}
    address { '東京都' }
    house_number { '1-1' }
    phone_number {'09011111111'}
    item_id {2}
    user_id {2}
  end
end