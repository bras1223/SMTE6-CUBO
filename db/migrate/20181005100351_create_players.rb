class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :name
      t.text :gender
      t.boolean :isHost
      t.text :location
      t.number :score

      has_and_belongs_to_many :games

      t.timestamps
    end
  end
end
