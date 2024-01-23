class CreateGameClues < ActiveRecord::Migration[7.1]
  def change
    create_table :game_clues do |t|
      t.references :game, index: true, null: false, foreign_key: true
      t.references :clue_word, index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
