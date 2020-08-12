Booking.destroy_all
puts "Seeding some shit"
puts "destroying toilets"
Toilet.destroy_all
puts "destroying users"
User.destroy_all
alphabet = ('a'..'z').to_a
adj = ["high tech", "clean","grand", "beautiful","spacious"]
location = ["shibuya","meguro","shinjuku", "gotanda", "mejiro", "ikebukuro", "shimokitaza"]
category = ["washiki", "outhouse", "washlet", "American Standard", "Luxury"]
first_name  = ["John", "Jake", "Melanie", "Jane", "Timothy", "Alfred", "Jessica"]
last_name = ["Alaska", "Robinson", "Johnson", "Kim", "Yamada", "Balona", "Wen"]
story = ["You will enjoy a foot rub while releiving yourself.", "A crowd will cheer you on as you do your business!", "On summer nights you can see fireworks while making some of your own.", "Take care of your necessities in a zen like state."]

25.times do
  getuser = User.new(
    first_name: first_name.sample,
    last_name: last_name.sample,
    password:"123123"
  )
  getuser.email = "#{getuser.first_name}.#{getuser.last_name}#{rand(0..99)}@loo4you.com"
  getuser.save!

  temp_location = location.sample.capitalize
  Toilet.create!(
    title: "A #{adj.sample} toilet #{temp_location}",
    description: "This #{adj.sample} toilet is located somewhere in #{temp_location}. #{story.sample}",
    category: category.sample,
    price: rand(200..5000),
    address: "#{temp_location} #{rand(0..10)}-#{rand(0..999)}",
    user:  getuser
  )

end
puts "You have #{User.count} users, you lucky bastard!"
puts "You have #{Toilet.count} toilets, you lucky bastard!"
