FactoryBot.define do
  factory :order_address do
    postal_code { '123-0000' }
    prefecture_id { 3 }
    city { '八潮市' }
    house_number { '1-1-1' }
    phone_number { '08088888888' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
