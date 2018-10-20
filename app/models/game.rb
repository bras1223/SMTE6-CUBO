class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :challenges, dependent: :destroy

  def initialize()
    @joinCode = RandomWord.nouns.next
  end

  def start_game
    @startTime = DateTime.now
  end
end
