FactoryGirl.define do
  factory :user do
    callsign              Faker::StarWars.vehicle
    password              Faker::Lorem.characters(16)
    firstname             Faker::Ancient.god
    lastname              Faker::Ancient.primordial
    email                 Faker::Internet.email
  end
  factory :logged_in_user do
    callsign              Faker::StarWars.vehicle
    password              Faker::Lorem.characters(16)
    api_token             "XnFbAQYtNd3U9PqLwqChZEhC"
  end
end
