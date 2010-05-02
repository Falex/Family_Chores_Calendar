class Calendar < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :chores, :dependent => :destroy
  has_many :users
  belongs_to :users
  #belongs_to :family
  
  validates_presence_of :title
  validates_length_of :title, :minimum => 3
  validates_length_of :title, :maximum => 40

end
