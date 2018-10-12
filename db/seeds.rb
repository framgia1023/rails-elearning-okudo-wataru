# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
	k = rand(1..8)
	User.create!(
		name: Faker::Pokemon.name,
		email: Faker::Internet.unique.email,
		password: "password",
		image: "/avator#{k}.png")
end

# cat_id = 1
# wor_id = 1

10.times do 
	Category.create!(
		title: Faker::Zelda.location,
		description: Faker::HarryPotter.quote
		)
	# 5.times do 
	# 	Word.create!(
	# 		content: Faker::Pokemon.name,
	# 		category_id: cat_id
	# 		)

		# 4.times do |c|
		# 	if (c == 4)
		# 		Choice.create!(
		# 			content: Faker::Dragonball.character,
		# 			word_id: wor_id,
		# 			correct: true
		# 			)
		# 	else
		# 		Choice.create!(
		# 			content: Faker::Zelda.character,
		# 			word_id: wor_id,
		# 			correct: false
		# 			)
		# 	end
		# end
		# wor_id += 

	# end

	# cat_id += cat_id

end