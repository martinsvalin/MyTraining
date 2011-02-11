Factory.define :training do |t|
  t.association :person
  t.default_points 1000
  t.title "Swimming"
  t.location "Rooftop pool"
  t.start_at 1.hour.from_now
  t.end_at 2.hours.from_now
end