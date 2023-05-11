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
hikarigaoka_park_array = [
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1680505231/hika-park-spring_fxl13w.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1680505220/hika-park-summer_gtzvgt.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1680505206/hika-park_hs4toq.jpg",
]
honkaku_temple_array = [
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683785739/honkaku_ezn3ac.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683785744/honkakuji_ugeigr.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683785751/honkaku-inside_s2yevj.jpg",
]
anrakutei_array = [
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788507/yakiniku-out_boyeul.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788512/yakiniku-plate_gltzi9.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788526/yakiniku-cooked_rrzdmr.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788521/yakiniku-set_nu5zrx.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788516/yakiniku-steak_ugu3ke.jpg",
  "https://res.cloudinary.com/dwufxkqdp/image/upload/v1683788501/yakiniku-menu_ou2axy.jpg",
]
nerima_museum_array = [
 # add photos
  ]

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

spot_creation(User.first, masamoto_bakery_array, name: "Masamoto Bakery", location: "175-0092 Tokyo, Itabashi, Akatsuka, 276", category: "food", sub_category: "bakery", hours_open: "12pm to 8pm, Wednesday through Saturday", description: "Technically not Nerima, but it's right along the boarder so we'll count it. A great local bakery that even sells some beer!", picture_array_name: "MasamotoBakery", photo_type: "jpg")
spot_creation(User.last, hikarigaoka_park_array, name: "Hikarigaoka Park", location: "411 Hikarigaoka, Nerima, Tokyo", category: "experience", sub_category: "park", hours_open: "Open 24 hours", description: "Beautiful park perfect for outdoor activities all year long.", picture_array_name: "HikarigaokaPark", photo_type: "jpg")
spot_creation(User.last, honkaku_temple_array, name: "Honkaku Temple", location: "179-0071 Tokyo, Nerima, Asahicho, 1265", category: "experience", sub_category: "shrine", hours_open: "Open 24 hours", description: "Historical shrine established in the early 17th century .", picture_array_name: "HonkakuTemple", photo_type: "jpg")
spot_creation(User.last, anrakutei_array, name: "Anrakutei Heiwadaiten", location: "21735 Hayamiya, Nerima, Tokyo,  ", category: "food", sub_category: "yakiniku", hours_open: "11am to 10pm", description: "Delicious and convenient yakiniku restaurant near Heiwadai Station.", picture_array_name: "Anrakutei", photo_type: "jpg")
spot_creation(User.last, nerima_museum_array, name: "Nerima Art Museum", location: "〒176-0021 東京都練馬区貫井１丁目３６−１６", category: "experience", sub_category: "museum", hours_open: "10am to 6pm Tuesday to Sunday", description: "Fascinating exhibitions centered on modern & contemporary Japanese art", picture_array_name: "NerimaMuseum", photo_type: "jpg")

REVIEW_INFO = {
  rev_one: {
    comment: "Not my cup of tea, won't go back",
    rating: 1,
  },
  rev_two: {
    comment: "Ya know, not the best, but not the worst place I've been",
    rating: 2,
  },
             rev_three: {
               comment: "It was fine. Might go again",
               rating: 3,
  },
  rev_four: {
    comment: "A great place, I loved it!",
    rating: 4,
  },
  rev_five: {
    comment: "Literally my favorite. I will be back, soon, like tomorrow, maybe. Love it!!",
    rating: 5,
  },
}
REVIEW_OPTIONS = %w(rev_one rev_two rev_three rev_four rev_five)

def create_review(user, spot)
  review = Review.new
  review_info = REVIEW_OPTIONS.sample
  review.comment = REVIEW_INFO[review_info.to_sym][:comment]
  review.rating = REVIEW_INFO[review_info.to_sym][:rating]
  review.user = user
  review.spot = spot
  review.save
  puts "review saved!"
end

puts "Creating Reviews..."
create_review(User.first, Spot.last)
create_review(User.last, Spot.first)
puts "Seeds finished!"
