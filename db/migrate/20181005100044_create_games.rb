class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :startTime
      t.number :duration
      t.text :center
      t.text :centerRadius
      t.number :currentRadius
      t.number :startRadius

      has_and_belongs_to_many :players

      t.timestamps
    end
  end
end
