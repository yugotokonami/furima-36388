FactoryBot.define do
  factory :order_address do
    postcode {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    block {Faker::Address.street_address}
    building {'東京ハイツ'}
    phone_number {11111111111}
  end
end
