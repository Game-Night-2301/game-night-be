require 'faraday'

class GameService
  def conn
    @_conn ||= Faraday.new(url: "https://api.boardgameatlas.com/api/") do |connection|
      connection.headers['Content-Type'] = 'application/json',
      connection.params['client_id'] = ENV['BOARD_GAME_ATLAS_CLIENT_ID']
    end
  end

  def get_all_games
    skip = 0
    result = Array.new
    while skip <= 1000
      result.concat( JSON.parse(
        conn.get("search?skip=#{skip}&limit=100")
          .body, symbolize_names: true)[:games])
      skip += 100
    end
    result
  end

  def get_one_random_game
    JSON.parse(conn.get("search?random=true").body, symbolize_names: true)[:games].first
  end
end