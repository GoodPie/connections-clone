class CreateWords < ActiveRecord::Migration[7.1]
  def change

    create_table :words do |t|
      t.string :word
    end

    create_table :clues do |t|
      t.string :description
    end

    create_table :clue_words do |t|
      t.belongs_to  :word, index: true
      t.belongs_to :clue, index: true
    end
  end
end
