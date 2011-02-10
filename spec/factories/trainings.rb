Factory.define :training do |t|
  t.association :person
  t.default_points 1000
end