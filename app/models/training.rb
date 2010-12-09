class Training < ActiveRecord::Base
  has_many :workouts
  
  scope :in_week, lambda {|week_number| Training.date_from_week(week_number) }
  
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
  
  def self.date_from_week(week_number)
    date = Date.from_week_within_six_months(week_number)
    where(:start_at => date.beginning_of_week..date.end_of_week)
  end
end
