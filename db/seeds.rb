# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def user_admins(first_name, last_name)
  user = User.new
  user.email = "#{first_name}@yahoo.com"
  user.password = "password"
  user.first_name = first_name
  user.last_name = last_name
  user.description = "Hi! I'm #{first_name}, and I love Nerima! Exploring new areas and finding hidden spots, secret attractions, and little known hole in the walls is my hobby."
  user.save
end

puts "generating admins..."
user_admins("jackson", "socolofsky")
user_admins("luca", "vigotti")
user_admins("jim", "deef")
