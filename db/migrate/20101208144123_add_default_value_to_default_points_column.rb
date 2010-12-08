class AddDefaultValueToDefaultPointsColumn < ActiveRecord::Migration
  def self.up
    remove_column :trainings, :default_points
    add_column :trainings, :default_points, :integer, :default => 1000
    # If we only used postgres, an execute("ALTER TABLE `trainings` ALTER `default_points` SET DEFAULT 1000") would have worked.
    # But, alas, this is not supported by sqlite.
  end

  def self.down
    remove_column :trainings, :default_points
    add_column :trainings, :default_points, :integer
  end
end
