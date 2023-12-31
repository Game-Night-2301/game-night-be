# frozen_string_literal: true

# This is the create users migration
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :city
      t.string :state
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
