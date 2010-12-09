module TrainingsHelper
  def previous_week
    (Date.from_week_within_six_months(@week) - 7.days).cweek
  end

  def next_week
    (Date.from_week_within_six_months(@week) + 7.days).cweek
  end
  
  def this_week
    Date.from_week_within_six_months(@week).cweek
  end
end
