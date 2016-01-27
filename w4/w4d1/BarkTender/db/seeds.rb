# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# User.create!(name: 'Matt', email: 'matt@gmail.com')
# User.create!(name: 'Nhat', email: 'nhat@gmail.com')

100.times do
  User.create(username: Faker::Internet.user_name)
end

100.times do
  Contact.create(name: Faker::Name.name , email: Faker::Internet.safe_email, user_id: User.all.sample.id )
end

100.times do
  ContactShare.create(contact_id: Contact.all.sample.id, user_id: User.all.sample.id )
end
