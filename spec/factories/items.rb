FactoryBot.define do
  factory :item do
    association :user
    name {'教科書'}
    text {'英語について'}
    category_id {2}
    condition_id {2}
    prefecture_id {2}
    day_id {2}
    delivery_fee_id {2}
    price {500}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/テスト画像.png'), filename: 'テスト画像.png')
    end
  end
end
