class GameClue < ApplicationRecord
  belongs_to :clue_word
  belongs_to :game

end
