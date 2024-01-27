class CreateGuesses < ActiveRecord::Migration[7.1]
  def change
    create_table :guesses do |t|
      t.references :game, index: true, foreign_key: true, null: false
      t.references :word, {index: true, foreign_key: true, null: false}
      t.integer :guess_number, null: false
      t.timestamps
    end
  end
end
