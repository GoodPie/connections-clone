class CreateGames < ActiveRecord::Migration[7.1]
  def change

    create_table :players do |t|
      t.string :code # We'll use a code to identify players
      t.timestamps
    end

    create_table :games do |t|

      t.references :player, index: true, foreign_key: true, null: false
      t.integer :mistakes_made, default: 0
      t.integer :mistakes_allowed, default: 6
      t.boolean :game_over, default: false
      t.boolean :game_won, default: false
      t.timestamps
    end
  end
end
