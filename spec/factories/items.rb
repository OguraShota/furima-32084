FactoryBot.define do
  factory :item do
    name { 'リンゴ' }
    category_ { 2 }
    condition_ { 2 }
    description { 'フルーツです' }
    postage_type_ { 2 }
    preparation_day_ { 2 }
    ship_from_ { 2 }
    price { '300' }
  end
end
