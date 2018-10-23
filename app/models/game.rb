class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :challenges, dependent: :destroy

  def initialize(args)
    super(args)
    self.joinCode = generate_code(5)
  end

  def start
    self.startTime = DateTime.now
    self.active = true
  end

  def end
    self.active = false
  end

  def reached_max_players
    if players.size < playerCount
      return false
    else
      return true
    end
  end

  def generate_code(number)
    SecureRandom.hex(number)
  end
end
