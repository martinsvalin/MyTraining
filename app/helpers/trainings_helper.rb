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
  
  def training_article_class(training)
    if training.person == current_user || training.workout_for_person(current_user)
      "your"
    elsif training.person.is_a? Person
      "other"
    else
      "everyone"
    end
  end
end
