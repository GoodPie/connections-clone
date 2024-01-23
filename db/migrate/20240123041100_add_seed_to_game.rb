class AddSeedToGame < ActiveRecord::Migration[7.1]
  def change
    change_table :games do |t|
      t.string :seed, null: false
    end
  end
end
