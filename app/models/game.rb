class Game < ApplicationRecord
  has_many :game_clues
  belongs_to :player
end
