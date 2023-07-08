# frozen_string_literal: true

# This is the user model
class User < ApplicationRecord
  has_many :user_games
  has_many :user_events
  has_many :events, through: :user_events
end
