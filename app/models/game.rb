class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :challenges, dependent: :destroy


  def initialize(args)
    @joinCode = generate_code(5)
    super(args)
  end

  def start_game
    @startTime = DateTime.now
    @active = true
  end

  def end_game
    @active = false
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

end
