class Challenge < ApplicationRecord
  belongs_to :game

  has_one :player, :class_name => 'Player', :foreign_key => 'winner_id'
  has_one :player, :class_name => 'Player', :foreign_key => 'loser_id'
end
