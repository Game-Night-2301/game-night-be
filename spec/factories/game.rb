FactoryBot.define do
  factory :game do
    name { Faker::Game.title }
    min_players { Faker::Number.between(from: 1, to: 4) }
    max_players { Faker::Number.between(from: 1, to: 100) }
    min_playtime { Faker::Number.between(from: 1, to: 60) }
    max_playtime { Faker::Number.between(from: 1, to: 360) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    image_url { Faker::Internet.url }
    average_user_rating {Faker::Number.between(from: 0.0, to: 5.0) }
    average_strategy_complexity {Faker::Number.between(from: 0.0, to: 5.0) }
  end
end