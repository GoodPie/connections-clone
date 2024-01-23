class AddClueCountToGame < ActiveRecord::Migration[7.1]
  def change
    change_table :games do |t|
      t.numeric :clue_count, default: 0, null: false
    end
  end
end
