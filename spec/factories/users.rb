FactoryBot.define do
  password = '1a' + Faker::Internet.password(min_length: 6, max_length: 8)

  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    last_name             { '田中' }
    last_name_kana        { 'タナカ' }
    first_name            { '一郎' }
    first_name_kana       { 'イチロウ' }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2020-12-31') }
  end
end
