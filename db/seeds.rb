# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

puts "-------- All Users Destroyed --------"
puts "Inventing people..."

10.times do 
	User.create(name: Faker::Name.name, mail: Faker::Internet.email)
end


puts "-------- All Products Destroyed --------"
puts "Inventing some weird stuff..."

User.all.each do |user|
	(1..3).each do |i|
		user.products.create(title: Faker::Lorem.word, description: Faker::Lorem.sentence)
	end
end