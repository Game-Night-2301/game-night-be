class CreateUserEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_events do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
