class Word < ApplicationRecord
  has_many :clue_words
  has_many :game_clues, through: :clue_words
end
