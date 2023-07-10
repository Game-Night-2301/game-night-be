# This is a class to build games with which to seed the games table in the database.
class GameFactory
  def build_games(game_data)
    game_data.each do |datum|
      Game.create(
        bga_id: datum[:id],
        name: datum[:name],
        min_players: datum[:min_players],
        max_players: datum[:max_players],
        min_playtime: datum[:min_playtime],
        max_playtime: datum[:max_playtime],
        description: datum[:description],
        image_url: datum[:image_url],
        average_user_rating: datum[:average_user_rating],
        average_strategy_complexity: datum[:average_strategy_complexity]
      )
    end
  end
end