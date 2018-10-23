class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :gender
      t.boolean :isHost
      t.string :location
      t.integer :score

      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
