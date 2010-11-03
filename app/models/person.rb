class Person < ActiveRecord::Base
  has_many :workouts
  
  def to_s
    name
  end
  
  def total_points
    workouts.sum(:points)
  end
  
end
