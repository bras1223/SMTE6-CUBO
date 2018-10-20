class Game < ApplicationRecord
  has_and_belongs_to_many :players
  has_many :challenges

  def start_game

  end
end
