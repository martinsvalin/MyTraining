class Workout < ActiveRecord::Base
  belongs_to :person
  belongs_to :training
  after_create :recalculate_points
  after_destroy :recalculate_points

  before_validation :set_points, :on => :create
  validates_numericality_of :points
  validates_presence_of :training

  def set_points
    self.points = training.default_points
  end
  
  def recalculate_points
    training.recalculate_points_for_workouts
  end
end
