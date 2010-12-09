class AddOwnerToTraining < ActiveRecord::Migration
  def self.up
    add_column :trainings, :person_id, :integer
  end

  def self.down
    remove_column :trainings, :person_id
  end
end
