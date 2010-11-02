class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end
