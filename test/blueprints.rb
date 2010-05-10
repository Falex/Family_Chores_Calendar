require 'machinist/active_record'
#require 'sham'
#require 'faker'

Sham.title  { Faker::Name.name }
Sham.description { Faker::Lorem.sentence }
Sham.user_name {Faker::Internet.user_name}
Sham.email {Faker::Internet.email}


Event.blueprint do
  description {Sham.description}
  start_on "2010-03-02"
end

Calendar.blueprint do
  title {Sham.title}
  description {Sham.description}
end

User.blueprint do
  password "abcdefghi"
  login {Sham.user_name}
  email {Sham.email}
  
end
  
Chore.blueprint do
  title {Sham.title}
  image_url {Sham.title}
end