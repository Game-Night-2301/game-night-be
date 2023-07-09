# frozen_string_literal: true

# This is the even model
class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  validates_presence_of :date, :address, :city, :state, :zip, :title, :description, :host_id, :game, :game_type, :lat, :lon
end
