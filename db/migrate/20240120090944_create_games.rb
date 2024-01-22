class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|

      t.belongs_to :player, index: true
      t.integer :mistakes_made, default: 0
      t.integer :mistakes_allowed, default: 6
      t.boolean :game_over, default: false
      t.boolean :game_won, default: false
      t.timestamps
    end
  end
end
