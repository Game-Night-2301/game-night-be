class CreateUserGames < ActiveRecord::Migration[7.0]
  def change
    create_table :user_games do |t|
      t.references :user_id, null: false, foreign_key: true
      t.bigint :game_id

      t.timestamps
    end
  end
end
