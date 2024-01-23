# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_23_041304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clue_words", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "clue_id"
    t.index ["clue_id"], name: "index_clue_words_on_clue_id"
    t.index ["word_id"], name: "index_clue_words_on_word_id"
  end

  create_table "clues", force: :cascade do |t|
    t.string "description"
  end

  create_table "game_clues", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "clue_word_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clue_word_id"], name: "index_game_clues_on_clue_word_id"
    t.index ["game_id"], name: "index_game_clues_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "mistakes_made", default: 0
    t.integer "mistakes_allowed", default: 6
    t.boolean "game_over", default: false
    t.boolean "game_won", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seed", null: false
    t.decimal "clue_count", default: "0.0", null: false
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
  end

  add_foreign_key "clue_words", "clues"
  add_foreign_key "clue_words", "words"
  add_foreign_key "game_clues", "clue_words"
  add_foreign_key "game_clues", "games"
  add_foreign_key "games", "players"
end
