# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a whole bunch of clues and associated words
clues = {
  "A type of animal": [
    "Aardvark",
    "Abyssinian",
    "Affenpinscher",
    "Akbash",
    "Cat",
    "Dog",
  ],
  "Exchange of money": [
    "Buy",
    "Sell",
    "Trade",
    "Borrow",
    "Lend",
    "Rent",
    "Lease",
  ],
  "__ Juice": [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Blueberry",
    "Carrot",
    "Cranberry",
    "Grape",
    "Grapefruit",
    "Lemon",
    "Lime",
  ],
  "Common Birthday Items": [
    "Balloon",
    "Cake",
    "Candle",
    "Card",
    "Gift",
    "Hat",
    "Ice Cream",
    "Party",
    "Streamers",
  ],
  "Australian Animals": [
    "Bandicoot",
    "Bilby",
    "Dingo",
    "Echidna",
    "Emu",
    "Kangaroo",
    "Koala",
    "Kookaburra",
    "Platypus"
  ],
  "Description of nothing": [
    "Blank",
    "Empty",
    "Hollow",
    "Vacant",
    "Void",
    "Zero",
  ],
  "Space between two objects": [
    "Gap",
    "Interval",
    "Space",
    "Distance",
    "Separation",
  ],
  "Weight of an item": [
    "Gram",
    "Kilogram",
    "Ounce",
    "Pound",
    "Ton",
  ],
  "Associated with the monarchy": [
    "Crown",
    "King",
    "Queen",
    "Prince",
    "Princess",
    "Royal",
    "Throne",
  ],
  "Description of beauty": [
    "Beautiful",
    "Gorgeous",
    "Pretty",
    "Stunning",
    "Lovely",
    "Attractive",
    "Elegant",
    "Exquisite",
    "Handsome",
    "Ravishing",
  ],
  "Stone or rock": [
    "Boulder",
    "Cobble",
    "Gravel",
    "Pebble",
    "Rock",
    "Stone",
  ],
  "Associated with the ocean": [
    "Beach",
    "Boat",
    "Fish",
    "Ocean",
    "Sand",
    "Sea",
    "Shell",
    "Surf",
    "Swim",
    "Tide",
    "Wave",
  ],
  "Video Transitions": [
    "Cut",
    "Dissolve",
    "Fade",
    "Jump Cut",
    "Wipe",
  ],
  "Blunt Weapons": [
    "Bat",
    "Club",
    "Hammer",
    "Mace",
    "Sledgehammer",
  ],
  "Term of Approval": [
    "Awesome",
    "Cool",
    "Excellent",
    "Fantastic",
    "Great",
    "Nice",
    "Outstanding",
    "Super",
    "Terrific",
    "Wonderful",
  ],
}

clues.each do |clue, words|
  clue = Clue.find_or_create_by!(description: clue)
  words.each do |word|
    word = Word.find_or_create_by!(word: word)
    ClueWord.find_or_create_by!(clue_id: clue.id, word_id: word.id)
  end
end

