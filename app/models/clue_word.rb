class ClueWord < ApplicationRecord
  belongs_to :game_clue
  belongs_to :word
end
