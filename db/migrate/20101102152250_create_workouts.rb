class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.integer :person_id
      t.integer :training_id
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
