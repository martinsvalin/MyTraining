class Authorization < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_from_hash!(auth, person = nil)
    person ||= Person.create_from_hash!(auth)
    Authorization.create(:person => person, :uid => auth['uid'], :provider => auth['provider'])
  end
end
