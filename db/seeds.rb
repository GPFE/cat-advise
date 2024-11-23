# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
20.times do
  User.create(email: "#{Faker::Artist.name}#{rand(50)}@mailhaha#{rand(90)}.iuu",
   password: "feeeee",
    username: "#{Faker::Artist.name} #{rand(90)}")
end

20.times do
  Post.create(name: Faker::Creature::Cat.breed, content: Faker::Quote.famous_last_words, owner_id: rand(User.all.length + 1))
end