class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :duration
      t.integer :timeleft

      t.timestamps
    end
  end
end
