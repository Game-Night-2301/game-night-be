class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :title
      t.boolean :cancelled
      t.string :description
      t.bigint :host_id
      t.bigint :game
      t.string :game_type
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
