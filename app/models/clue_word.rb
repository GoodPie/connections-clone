class ClueWord < ApplicationRecord
  belongs_to :clue
  belongs_to :word
  has_many :game_clues
end
