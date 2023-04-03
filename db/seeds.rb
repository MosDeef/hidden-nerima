# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

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

masamoto_bakery_array = [
  "https://res.cloudinary.com/dfjkxrkvj/image/upload/v1680499534/Hidden%20Nerima%20Samples/eydfw2xjqghytsiriqin.jpg",
  "https://res.cloudinary.com/dfjkxrkvj/image/upload/v1680499544/Hidden%20Nerima%20Samples/v5jt7rnajjwy3khidvsd.jpg",
  "https://res.cloudinary.com/dfjkxrkvj/image/upload/v1680499545/Hidden%20Nerima%20Samples/amq60mkn0ysndluomi6f.jpg",
  "https://res.cloudinary.com/dfjkxrkvj/image/upload/v1680499545/Hidden%20Nerima%20Samples/mdqnctewlptetwxa5kno.jpg",
  "https://res.cloudinary.com/dfjkxrkvj/image/upload/v1680499545/Hidden%20Nerima%20Samples/yykbmufgy8ysiavec0lh.jpg",
]
Spot.destroy_all

def spot_creation(user, picture_array, hash = {})
  puts "making spot"
  spot = Spot.new(name: hash[:name], location: hash[:location], category: hash[:category], sub_category: hash[:sub_category], hours_open: hash[:hours_open])
  spot.description = hash[:description]
  spot.user = user
  puts "attaching photos"
  picture_array.each do |url, i|
    puts "photo #{i}"
    file = URI.open(url)
    spot.photos.attach(io: file, filename: "#{hash[:picture_array_name]}Picture#{i}.#{hash[:photo_type]}", content_type: "image/#{hash[:photo_type]}")
  end
  puts "saving..."
  spot.save
  puts "complete!"
end

spot_creation(User.first, masamoto_bakery_array, name: "Masamoto Bakery", location: "175-0092 Tokyo, Itabashi City, Akatsuka, 2 Chome−7−6", category: "food", sub_category: "bakery", hours_open: "12pm to 8pm, Wednesday through Saturday", description: "Technically not Nerima, but it's right along the boarder so we'll count it. A great local bakery that even sells some beer!", picture_array_name: "MasamotoBakery", photo_type: "jpg")
