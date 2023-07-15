# Activerecord model which hold game information
class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  def self.search_results(term)
    Game.where("LOWER(name) ILIKE ?", "%#{term.downcase}%")
  end

  def self.verify_games(names)
    names.map do |game_name|
      if (this_game = Game.where("name ILIKE ?", "%#{game_name}%").first)
        this_game
      else
        Game.last
      end
    end
  end
end
