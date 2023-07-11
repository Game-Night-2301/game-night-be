# frozen_string_literal: true

# This is the even model
class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  validates_presence_of :date, :address, :city, :state, :zip, :title, :description, :host_id, :game, :game_type

  geocoded_by :full_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode


  def find_host(host_id)
    users.find_by_id(host_id)
  end

  def player_count
    users.count
  end

  def full_address
    "#{address} #{city}, #{state} #{zip.to_s.rjust(5, "0")}"
  end


end
