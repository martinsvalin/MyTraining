class RenameStartTimeToStartAt < ActiveRecord::Migration
  def self.up
    rename_column :trainings, :start_time, :start_at
    rename_column :trainings, :end_time, :end_at
  end

  def self.down
    rename_column :trainings, :start_at, :start_time
    rename_column :trainings, :end_at, :end_time
  end
end