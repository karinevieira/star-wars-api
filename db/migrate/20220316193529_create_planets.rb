class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :weather
      t.string :ground

      t.timestamps
    end
  end
end
