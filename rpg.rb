#RPG




puts "What is your name?"

	hero = {"name": "", "health_points": 10}

	hero[:name] = gets.chomp.capitalize!

puts "#{hero[:name]} enters the forest!"

puts "Hi #{hero[:name]}! Prepare for battle!"

puts "... will #{hero[:name]} fight or flee?"

fight_flee = gets.chomp.lowercase

def fight

	#########

end

def flee

	######

end

question = true

while question
if fight_flee == "y" || fight_flee == "yes"
	fight()
	question = false
elsif fight_flee == "n" || fight_flee == "no"
	flee()
	question = false
else
	puts "Type yes or no"
end
