# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Fantasy::Tolkien.character }
    password { Faker::Internet.password }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end
