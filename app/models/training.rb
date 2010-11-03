class Training < ActiveRecord::Base
  has_many :workouts
  
  def to_s
    title
  end
  
  def workout_for_person(person)
    self.workouts.find_by_person_id(person)
  end
  
end
