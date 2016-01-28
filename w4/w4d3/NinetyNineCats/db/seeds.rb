# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



100.times do
  Cat.create!(name: Faker::Name.name, color: Cat::COLORS.sample, birth_date: Faker::Date.backward(9999), sex: ["F",'M'].sample, description: Faker::Hipster.sentence, user_id: 5)
end

200.times do
  CatRentalRequest.create!(cat_id: Cat.all.sample.id, status: %w[APPROVED PENDING DENIED].sample, start_date: Faker::Date.backward(40), end_date: Faker::Date.forward(40))
end
