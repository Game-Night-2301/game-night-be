# frozen_string_literal: true

# This is the user event model
class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
