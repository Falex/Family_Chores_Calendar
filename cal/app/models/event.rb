class Event < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  belongs_to :chore

  validates_presence_of :title
  validates_length_of :title, :minimum => 3
  validates_length_of :title, :maximum => 40
end
