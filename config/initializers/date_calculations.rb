class Date
  def self.first_day_of_week(week_number, year)
    Date.commercial(year, week_number, 1)
  end
  
  def self.from_week_within_six_months(week_number)
    date = Date.first_day_of_week(week_number, Date.today.year)
    if (Date.today - 6.months > date)
      date = date + 1.year
    elsif (Date.today + 6.months < date)
      date = date - 1.year
    end
    date
  end
end
