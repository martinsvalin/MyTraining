class Workout < ActiveRecord::Base
  belongs_to :person
  belongs_to :training

  before_validation :set_points, :on => :create

  validates_numericality_of :points
  
  private
    def set_points
      self.points = training.workouts.count >= 4 ? set_group_points_for_everyone : 1000
    end
    
    def set_group_points_for_everyone
      training.workouts.map {|workout| workout.update_attribute :points, 5000}
      5000
    end
end
