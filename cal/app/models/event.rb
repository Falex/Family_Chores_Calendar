class Event < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  belongs_to :chore
  

end
