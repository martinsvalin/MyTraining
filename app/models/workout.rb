class Workout < ActiveRecord::Base
  belongs_to :person
  belongs_to :training

  before_validation :set_points, :on => :create
  after_create :recalculate_points_for_others
  after_destroy :recalculate_points_for_others


  validates_numericality_of :points
  
  # private
    def set_points
      self.points = training.default_points
    end
    
    def recalculate_points_for_others
      if training.workouts.count >= 5
        training.workouts(:conditions => "points != 5000").map {|workout| workout.update_attribute :points, 5000}
        5000
      else
        training.workouts(:conditions => "points != 1000").map {|workout| workout.update_attribute :points, 1000}
        1000
      end
    end
end
