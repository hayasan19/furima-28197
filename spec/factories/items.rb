FactoryBot.define do
  factory :item do
    name                          {Faker::Name.initials(number: 2)}
    text                          {"あいうえお"}
    category_id                   {2}
    item_status_id                {2}
    item_fee_status_id            {2}
    item_prefecture_id            {2}
    item_scheduled_delivery_id    {2}
    price                         {"2222"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end

