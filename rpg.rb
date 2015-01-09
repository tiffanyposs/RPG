#RPG

puts "What is your name?"

	hero = {"name"=> "", "hit_points"=> 10, "hit_chance"=> 80}

	hero[:name] = gets.chomp.capitalize!

puts "#{hero[:name]} enters the forest!"

puts "Hi #{hero[:name]}! Prepare for battle!"

class Villain 
	def initialize(name)
		@name = name
		@hit_points = 6
		@hit_chance = 60
		# @strength = 4
		# @defense = 4
	end
end

def fight
	puts "#{hero[:name]} attacks!"
	#########
end

def flee
	######
end

fight_question = true

while fight_question == true
	puts "... will #{hero[:name]} fight or flee?"
	fight_flee = gets.chomp.downcase
	if fight_flee == "fight"
		fight()
		fight_question = false
	elsif fight_flee == "flee"
		flee()
		fight_question = false
	end
end
