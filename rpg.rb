#make an intro section that says the rule and object of the game

# Make a attribute that the hero must travel 100 miles
# to win the Game. Every battle they win they gain a certain
# amount of miles, and every time them flee they lose miles

# Each villian comes with attributes with a set amount of miles
# you can accomplish if you beat them

# add sword emojis to the fight sequence

# change monstar names



puts "What is your name?"

class Hero
  attr_accessor :name, :hit_points, :hit_chance
  def initialize(name)
    @name = name
    @hit_points = 10
    @hit_chance = 50
  end
end

player_name = gets.chomp.capitalize!

player = Hero.new(player_name)

puts "#{player.name} enters the forest!" 
sleep 1
puts "Hi #{player.name}! Prepare for battle!"
sleep 1

class Villain
  attr_accessor :name, :hit_points, :hit_chance
  def initialize(name)
    @name = name
    @hit_points = rand(1..10)# 1-10 hit points#6
    @hit_chance = rand(1..90)#1-90% chance hit chance#60
  end
end

#############
### fight method, passed into battle method
def fight(baddie, player)
#player attack
while player.hit_points > 0 && baddie.hit_points > 0
  x = rand(0..100)
  y = rand(0..100)
  sleep 1

  ###player attacks
  if player.hit_points > 0
  puts "#{player.name} attacks"
  sleep 1
  if x <= player.hit_chance 
    p_points = rand(2..4)
    baddie.hit_points-=p_points
    if player.hit_chance < 100  #make sure it doesn't go above 100%
      player.hit_chance+=2 #adds 2% chance on player hit chance
    end
puts '          />'
puts '         /<'
puts 'O[||||||(O):::<=======================-'
puts '         \<'
puts '         \>'
    puts "#{baddie.name} loses #{p_points} points"
  else
    puts "#{player.name} missed"
    player.hit_chance-=2 #subtracts 2% chance on player hit chance
  end #end if
  end


#baddie attack
  if baddie.hit_points > 0
  puts "#{baddie.name} attacks"
  sleep 1
  if y <= baddie.hit_chance
    b_points = rand(2..4)
    player.hit_points-=b_points
    if baddie.hit_chance < 100 #make sure it doesn't go above 100%
      baddie.hit_chance+=2 #adds 2% to baddie if successful hit
    end
  puts "#{player.name} loses #{b_points} points"
puts '           ||'
puts ' _         )( ______________________'
puts '(_)///////(**)______________________>'
puts '           )('
puts '           ||'
  else
    puts "#{baddie.name} missed"
    baddie.hit_chance-=2 #adds 2% to baddie if successful hit
  end
end

  sleep 1
end #end while

  if baddie.hit_points <= 0 && player.hit_points >= 0
    player.hit_points += 1
    puts "#{player.name} wins! Continue through the forest."
  end
  if player.hit_points <= 0 && player.hit_points >= 0
    puts "#{baddie.name} wins! Game Over"
  end

end #end fight
###############


#############
### flee method, passed into battle method
def flee(baddie, player, flee_points)
  puts "#{player.name} runs away from #{baddie.name}."
  sleep 1
  player.hit_points-=flee_points
  return "#{player.name} has #{player.hit_points} hit points left"
end #end flee


############
### initiates a battle with the 
def battle(player)
 

  bad_guys = ["Amanda", "Brittany", "Ashley", "Maria", "Nichole"]
  flee_points = rand(2..4)
#sample chooses a random one in an array
  baddie = Villain.new(bad_guys.sample)
  puts "You encounter a #{baddie.name}, it has #{baddie.hit_points} hit points and #{baddie.hit_chance}% hit success. "
  sleep 1
  puts "You have #{player.hit_points} hit points and #{player.hit_chance}% hit chance"
  sleep 1


round = true
while round == true
  puts "Would you like to fight #{baddie.name}? or flee for #{flee_points} points?"
  fight_flee = gets.chomp
if fight_flee.downcase == "fight"
  while baddie.hit_points > 0 && player.hit_points > 0
  puts fight(baddie, player)
  round = false
  end
elsif fight_flee.downcase == "flee" 
  if player.hit_points >= flee_points+1
    puts "lets flee"
    puts flee(baddie, player, flee_points)
    round = false
  end
  if player.hit_points <= flee_points
    puts "You don't have enough hit points to flee, you must fight"
  end
else
  puts "that not an answer"
end # end main if
end

end #end battle method



while player.hit_points > 0
battle(player)
if player.hit_points <= 0
  puts "You lost all you're hit points"
  puts "GAME OVER"
end
end




