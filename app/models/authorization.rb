class Authorization < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, person = nil)
    person ||= Person.create_from_hash!(hash)
    Authorization.create(:person => person, :uid => hash['uid'], :provider => hash['provider'])
  end
end
