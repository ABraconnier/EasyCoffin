# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Prestation.create!(review: 1, location: "brussels", price: 3, client: client, mourner: mourner)


10.times do
  Mourner.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    account_number: Faker::Bank.iban(country_code: "be"),
    rating: (0..10).to_a.sample,
    age: (25..55).to_a.sample,
    years_of_expertise: (1..25).to_a.sample,
    mourning_intensity: (0..5).to_a.sample,
    price_range: (20..55).to_a.sample
    )
end

