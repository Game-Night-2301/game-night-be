# frozen_string_literal: true

# This is the user game model
class UserGame < ApplicationRecord
  belongs_to :user

  validates_presence_of :game
end
