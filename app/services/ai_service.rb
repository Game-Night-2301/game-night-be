require 'json'
require 'faraday'

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
          #                 Please include only the name of the games, in the form of strings within an array."
        }
      ],
      'temperature': 0.8
    }

    JSON.parse(
      conn.post do |request|
      request.body = payload.to_json
    end.body, symbolize_names: true
    )
  end
end


#   def conn
#     @_conn ||= Faraday.new(url: 'https://api.openai.com/') do |f|
#       f.headers['Authorization'] = "Bearer #{ENV['OPEN_AI_API_KEY']}" 
#       f.headers['content-type'] = 'application/json'
#     end
#   end

#   def get_games(collection)
#     params = {
#       model: "gpt-3.5-turbo",
      # messages: [
      #   {
      #     role: "user",
      #     content: "recommend me 3 board games based on the following collection of games. #{collection} 
      #                 Please include only the name of the games, in the form of strings within an array."
      #   }
      # ],
#       temperature: 0.8
#     }


#     response = conn.post('v1/chat/completions', JSON.generate(params))
# require 'pry'; binding.pry
#   end
# end