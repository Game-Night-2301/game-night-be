# frozen_string_literal: true

# This is the create user events migration
class CreateUserEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
