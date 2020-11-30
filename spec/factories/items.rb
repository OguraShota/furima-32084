FactoryBot.define do
  factory :item do
    name { 'リンゴ' }
    category_id { 1 }
    condition_id { 2 }
    description { 'フルーツです' }
    postage_type_id { 2 }
    preparation_day_id { 2 }
    ship_from_id { 2 }
    price { '300' }
    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end