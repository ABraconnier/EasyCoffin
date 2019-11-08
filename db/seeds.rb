# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  url = "https://source.unsplash.com/random/500x500/?crying,person"
  url_places = "https://geo.api.gouv.fr/communes"
  json_file = JSON.parse(open(url_places).read)
  mourner = Mourner.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    account_number: Faker::Bank.iban(country_code: "be"),
    rating: (0..10).to_a.sample,
    age: (25..55).to_a.sample,
    years_of_expertise: (1..25).to_a.sample,
    mourning_intensity: (0..5).to_a.sample,
    price_range: (20..55).to_a.sample,
    location: json_file.sample['nom']
    )
  mourner.remote_photo_url = url
  mourner.save
end

