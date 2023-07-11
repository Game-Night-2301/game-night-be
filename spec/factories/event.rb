# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    date { Faker::Date.forward(days: 23) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    title { Faker::Game.title }
    cancelled { Faker::Boolean.boolean }
    description { Faker::Lorem.paragraph }
    host_id { Faker::Number.number(digits: 1) }
    game { Faker::Number.number(digits: 1) }
    game_type { Faker::Game.genre }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default).split(' ')[4] }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default).split(' ')[4] }
  end
end
