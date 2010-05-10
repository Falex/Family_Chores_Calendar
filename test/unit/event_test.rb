require 'test_helper'

class EventTest < ActiveSupport::TestCase
 test "save an event" do
    event = Event.new(:description =>"Hallo", :start_on => "2009-01-01")
	event.save
    assert_equal 1, Event.count
  end

  test "should not be longer than 40 characters" do
    event = Event.make_unsaved(:description => "*************************************************")
	assert !event.valid?
  end
end
