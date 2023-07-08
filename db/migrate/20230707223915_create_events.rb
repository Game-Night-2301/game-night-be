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
      t.references :host_id, null: false, foreign_key: true
      t.bigint :game_id
      t.string :type
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
