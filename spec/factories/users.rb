FactoryGirl.define do
  factory :user do
    callsign              Faker::Ancient.hero
    password              'password'
    password_confirmation 'password'
    firstname             Faker::Ancient.god
    lastname              Faker::Ancient.primordial
    email                 Faker::Internet.email
    api_token             ''
  end
end
