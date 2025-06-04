# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing existing records..."

Application.destroy_all
Vacancy.destroy_all
Band.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(
  email: "milo@milo.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Milo",
  last_name: "Vingoe",
  username: "milo",
  bio: "I am a musician and I love to play the guitar. I am looking for a band to join.",
  address: "London, UK"
)

User.create!(
  email: "james@james.com",
  password: "password",
  password_confirmation: "password",
  first_name: "James",
  last_name: "Kay-Shuttleworth",
  username: "james",
  bio: "I am a drummer and I love to play the drums.",
  address: "London, UK"
)

User.create!(
  email: "admir@admir.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Admir",
  last_name: "Kurman",
  username: "admir",
  bio: "I am a bassist and I love to play the bass.",
  address: "London, UK"
)

puts "Created #{User.count} users."

puts "Creating bands..."

Band.create!(
  name: "The Rockers",
  address: "London, UK",
  bio: "We are a rock band from London. We love to play rock music and we are looking for new members.",
  genre: "Rock",
  user_id: User.first.id
)

Band.create!(
  name: "The Jazzers",
  address: "London, UK",
  bio: "We are a jazz band from London. We love to play jazz music and we are looking for new members.",
  genre: "Jazz",
  user_id: User.second.id
)

puts "Created #{Band.count} bands."

puts "Creating vacancies..."

Vacancy.create!(
  instrument: "Guitar",
  description: "We are looking for a guitarist to join our band. You must be able to play rock music and have your own equipment.",
  filled: false,
  band_id: Band.first.id
)

puts "Created #{Vacancy.count} vacancies."

puts "Creating applications..."

Application.create!(
  pitch: "I am a guitarist and I love to play rock music. I have my own equipment and I am available to rehearse.",
  user_id: User.last.id,
  vacancy_id: Vacancy.first.id
)

puts "Created #{Application.count} applications."

puts "Seeding completed successfully!"
