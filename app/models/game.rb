# Activerecord model which hold game information
class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  def self.search_results(term)
    Game.where("LOWER(name) ILIKE ?", "%#{term.downcase}%")
  end

  def self.verify_games(names)
    names.map do |game_name|
      Game.where("name ILIKE ?", "%#{game_name}%").first
    end
  end
end
