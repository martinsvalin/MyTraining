class AddDefaultPointsToTraining < ActiveRecord::Migration
  def self.up
    add_column :trainings, :default_points, :integer
    Training.update_all "default_points = 1000"
  end

  def self.down
    remove_column :trainings, :default_points
  end
end
