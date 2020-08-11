Booking.destroy_all
puts "Seeding some shit"
puts "destroying toilets"
Toilet.destroy_all
puts "destroying users"
User.destroy_all
alphabet = ('a'..'z').to_a
adj = ["high tech", "clean","elegant", "beautiful","spacious"]
location = ["shibuya","meguro","shinjuku", "gotanda", "mejiro", "ikebukuro", "shimokitaza"]
category = ["old school", "new school", "squatty potty", "stall", "butt warming"]
first_name  = ["John", "Jake", "Melanie", "Jane", "Timothy", "Alfred", "Jessica"]
last_name = ["Alaska", "Robinson", "Johnson", "Kim", "Yamada", "Balona", "Wen"]

5.times do
  getuser = User.new(
    first_name: first_name.sample,
    last_name: last_name.sample,
    password:"123456"
  )
 getuser.email = "#{getuser.first_name}.#{getuser.last_name}@loo4you.com"
 getuser.save
Toilet.create!(
title: "#{adj.sample} toilet in the heart of #{location.sample}",
 description: "This toilet is shaped like an #{alphabet.sample}. The extension extends into a patio reaching until the end of that side of the house.
=======
  getuser.email = "#{getuser.first_name}.#{getuser.last_name}@loo4you.com"
  getuser.save!

  Toilet.create!(
    title: "#{adj.sample} toilet in the heart of #{location.sample}",
    description: "This toilet is shaped like an #{alphabet.sample}. The extension extends into a patio reaching until the end of that side of the house.
The second floor is smaller than the first, which allowed for several balconies on the sides of the house. This floor has a slightly different style than the floor below.",
    category: category.sample,
    price: "¥#{rand(500..200)}",
    address: "#{location.sample}",
    user:  getuser
  )

end
puts "You have #{User.count} users, you lucky bastard!"
puts "You have #{Toilet.count} toilets, you lucky bastard!"
