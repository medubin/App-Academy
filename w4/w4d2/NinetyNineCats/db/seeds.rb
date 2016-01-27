# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(name: "Gizmo", color: "calico", birth_date: Date.new(2009, 5, 3), sex: "M", description: "Friendly little guy.")
Cat.create!(name: "Markov", color: "green", birth_date: Date.new(1909, 12, 7), sex: "F", description: "Not friendly little guy.")

100.times do
  Cat.create!(name: Faker::Name.name, color: Cat::COLORS.sample, birth_date: Faker::Date.backward(9999), sex: ["F",'M'].sample, description: Faker::Hipster.sentence)
end

200.times do
  CatRentalRequest.create!(cat_id: Cat.all.sample.id, status: %w[APPROVED PENDING DENIED].sample, start_date: Faker::Date.backward(40), end_date: Faker::Date.forward(40))

end
