# Activerecord migration for games table
class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :bga_id
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.string :description
      t.string :image_url
      t.float :average_user_rating
      t.float :average_strategy_complexity

      t.timestamps
    end
  end
end
