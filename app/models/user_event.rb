# frozen_string_literal: true

# This is the user event model
class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, scope: :event_id
end
