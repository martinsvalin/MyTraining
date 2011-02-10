Factory.define :authorization do |a|
  a.association :person
  a.uid "abc"
  a.provider  "google"
end