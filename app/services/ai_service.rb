require 'json'
require 'faraday'
# this is our ai service
class AiService
  def conn
    @_conn = Faraday.new(url: "https://api.openai.com/v1/chat/completions?") do |connection|
      connection.headers['Content-Type'] = 'application/json'
      connection.headers['Authorization'] = "Bearer #{ENV['OPENAI_ACCESS_TOKEN']}"
    end
  end

  def get_games(collection)
    payload = {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          'role': 'user',
          'content': "recommend me 3 board games based on the following collection of games. #{collection}
                      Do not recommend games that are already in the collection you've been given and only recommend each game once.
                      Please include only the name of the games, in the form of strings within an array."
        }
      ],
      'temperature': 0.8
    }

    response = JSON.parse(
      conn.post do |request|
        request.body = payload.to_json
      end.body, symbolize_names: true
    )
    JSON.parse(response[:choices][0][:message][:content])
  end
end
