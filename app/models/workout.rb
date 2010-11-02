class Workout < ActiveRecord::Base
  belongs_to :person
  belongs_to :training
end
