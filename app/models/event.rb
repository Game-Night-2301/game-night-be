# frozen_string_literal: true

# This is the even model
class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
end
