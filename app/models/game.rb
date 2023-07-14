# Activerecord model which hold game information
class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  def self.search_results(term)
    Game.where("LOWER(name) ILIKE ?", "%#{term.downcase}%")
  end

  def verify_game(names)
    names.map do |name|
      Game.where("LOWER(name) ILIKE ?", "%#{name.downcase}%").first
    end
  end
end
