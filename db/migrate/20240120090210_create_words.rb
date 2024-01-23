class CreateWords < ActiveRecord::Migration[7.1]
  def change

    create_table :words do |t|
      t.string :word
    end

    create_table :clues do |t|
      t.string :description
    end

    create_table :clue_words do |t|
      t.references :word, index: true, foreign_key: true
      t.references :clue, index: true, foreign_key: true
    end
  end
end
