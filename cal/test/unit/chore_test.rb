require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  test "save an chore" do
    chore = Chore.new(:title => "Test Eintrag", :image_url =>"Hallo.jpg")
	chore.save
    assert_equal 1, Chore.count
  end
  
  test "should have a title" do
    chore = Chore.make_unsaved(:title => nil)
	assert !chore.valid?, "should have an error" 
  end
  
  test "should have a image_url" do
    chore = Chore.make_unsaved(:image_url => nil)
	assert !chore.valid?, "should have an error" 
  end
  
  test "title should be longer than 3 characters" do
    chore = Chore.make_unsaved(:title => "ha")
	assert !chore.valid?
  end
  
  test "title should not be longer than 40 characters" do
    chore = Chore.make_unsaved(:title => "********************************************************")
	assert !chore.valid?
  end
  
  test "image_url should be longer than 3 characters" do
    chore = Chore.make_unsaved(:image_url => "hi")
	assert !chore.valid?
  end
  
  test "image_url should not be longer than 40 characters" do
    chore = Chore.make_unsaved(:image_url => "********************************************************")
	assert !chore.valid?
  end
end
