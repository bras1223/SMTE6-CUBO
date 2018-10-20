class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :startTime
      t.boolean :active
      t.integer :duration
      t.string :center
      t.string :centerRadius
      t.integer :currentRadius
      t.integer :startRadius

      t.timestamps
    end
  end
end
