class Person < ActiveRecord::Base
  has_many :workouts
  has_many :trainings
  has_many :authorizations, :dependent => :destroy
  
  def to_s
    name
  end
  
  def total_points
    workouts.sum(:points)
  end
  
  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :email => hash['user_info']['email'])
  end
end
