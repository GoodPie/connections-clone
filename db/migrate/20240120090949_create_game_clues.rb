class CreateGameClues < ActiveRecord::Migration[7.1]
  def change
    create_table :game_clues do |t|

      t.timestamps
    end
  end
end
