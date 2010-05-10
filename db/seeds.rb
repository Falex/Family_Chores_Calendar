# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
chores = Chore.create([{:title => "kochen", :image_url => "kochen.jpg"},{:title => "Uhr kaufen", :image_url => "clock.jpg"}])