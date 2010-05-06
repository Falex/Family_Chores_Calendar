class Event < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  belongs_to :chore
  
  validates_length_of :description, :maximum => 40
end
