Factory.define :workout do |w|
  w.association :person
  w.association :training
  w.points 5000
end