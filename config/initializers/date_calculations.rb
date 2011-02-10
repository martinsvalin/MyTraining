class Date
  def self.first_day_of_week(week_number, year)
    Date.commercial(year, week_number, 1)
  end

  def self.from_week_within_six_months(week_number)
    year = Date.today.year
    year -= 1 if (Date.today.cweek - week_number).abs > 26
    Date.first_day_of_week(week_number, year)
  end
end
