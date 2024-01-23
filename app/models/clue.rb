class Clue < ApplicationRecord
  has_many :clue_words
  has_many :words, through: :clue_words
  has_many :game_clues
end
