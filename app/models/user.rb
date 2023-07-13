# frozen_string_literal: true

# This is the user model
class User < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events
  has_many :games, through: :user_games
  geocoded_by :resident_city, latitude: :lat, longitude: :lon
  after_validation :geocode

  validates_presence_of :username, :password, :city, :state

  def hosted_events
    events.where(host_id: id)
  end

  def resident_city
    "#{city}, #{state}"
  end

  def sort_events_by_distance
    Event.by_distance(origin: [lat, lon]).to_a.map do |event|
      json_event = event.as_json
      json_event["distance_from"] = event.distance_from([lat, lon])
      json_event
    end
  end
end
