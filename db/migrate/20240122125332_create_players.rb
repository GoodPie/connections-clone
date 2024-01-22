class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :code # We'll use a code to identify players
      t.timestamps
    end
  end
end
