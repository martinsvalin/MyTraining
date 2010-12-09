class Training < ActiveRecord::Base
  has_many :workouts, :dependent => :destroy
  belongs_to :person
  
  scope :in_week, lambda {|week_number| Training.where_start_at_in_week(week_number) }
  
  def self.where_start_at_in_week(week_number)
    date = Date.from_week_within_six_months(week_number)
    where(:start_at => date.beginning_of_week..date.end_of_week)
  end
  
  def to_s
    title
  end
  
  def workout_for_person(person)
    self.workouts.find_by_person_id(person)
  end

  def start_date
    start_at.present? ? start_at.to_date.to_s(:db) : nil
  end
  
  def start_time
    start_at.present? ? start_at.strftime('%H:%M') : nil
  end
  
  def duration
    if end_at.present? && start_at.present?
      ((end_at - start_at)/60).to_i
    else
      60
    end
  end
  
  def individual_training?
    person.present?
  end
  
  def recalculate_points_for_workouts
    if individual_training?
      set_points_for_workouts (workouts.count >= 5 ? default_points * 5 : default_points)
    end
  end

  private
  def set_points_for_workouts(points)
    workouts(:conditions => ["points != ?", points]).map {|workout| workout.update_attribute :points, points}
  end
end
