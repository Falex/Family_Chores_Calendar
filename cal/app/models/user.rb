class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :fam
  has_many :calendars
  has_many :events, :through => :calendars
  
end
