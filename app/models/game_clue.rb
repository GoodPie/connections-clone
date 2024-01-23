class GameClue < ApplicationRecord
  has_one :clue_word
  has_one :word, through: :clue_word
end
