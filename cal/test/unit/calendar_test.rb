require 'test_helper'

class CalendarTest < ActiveSupport::TestCase
  test "save a calendar" do
    calendar = Calendar.make(:title => "Test Eintrag", :description =>"Hallo")
	calendar.save
    assert_equal 1, Calendar.count
  end
  
  test "should have a title" do
    calendar = Calendar.make_unsaved(:title => nil)
	assert !calendar.valid?, "should have an error" 
  end
  
  test "should be longer than 3 characters" do
    calendar = Calendar.make_unsaved(:title => "ha")
	assert !calendar.valid?
  end
  
  test "should not be longer than 40 characters" do
    calendar = Calendar.make_unsaved(:title => "--------------------------------------------------------")
	assert !calendar.valid?
  end
end
  

