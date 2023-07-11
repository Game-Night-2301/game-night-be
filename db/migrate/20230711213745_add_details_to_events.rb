# frozen_string_literal: true

# This adds start time and end time to events
class AddDetailsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :start_time, :string
    add_column :events, :end_time, :string
  end
end
