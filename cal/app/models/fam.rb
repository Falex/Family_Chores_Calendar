class Fam < ActiveRecord::Base
  has_many :users
  has_one :calendar
end
