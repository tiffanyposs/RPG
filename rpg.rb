puts "What is your name?"

class Hero
  attr_accessor :name, :hit_points, :hit_chance
  def initialize(name)
    @name = name
    @hit_points = 10
    @hit_chance = 80
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
    @hit_points = 6
    @hit_chance = 60
  end
end


def fight(baddie, player)

#player attack
while player.hit_points > 0 && baddie.hit_points > 0
  x = rand(0..100)
  y = rand(0..100)
  sleep 1
  puts "#{player.name} attacks"
  sleep 1
  if x <= player.hit_chance 
    p_points = rand(2..4)
    baddie.hit_points-=p_points
    puts "#{baddie.name} loses #{p_points} points"
  else
    puts "#{player.name} missed"
  end #end if
  sleep 1
#baddie attack
  puts "#{baddie.name} attacks"
  sleep 1
  if y <= baddie.hit_chance
    b_points = rand(2..4)
    player.hit_points-=b_points
    puts "#{player.name} loses #{b_points} points"
  else
    puts "#{baddie.name} missed"
  end
  sleep 1
end #end while

  if baddie.hit_points <= 0 && player.hit_points >= 0
    puts "#{player.name} wins! Continue through the forest."
  end
  if player.hit_points <= 0 && player.hit_points >= 0
    puts "#{baddie.name} wins! Game Over"
  end

end #end fight


def flee(baddie, player)
  puts "#{player.name} runs away."
  player.hit_points-=rand(2..4)
  return "#{player.name} has #{player.hit_points} hit points left"
end #end flee


def battle(player)
  bad_guys = ["Amanda", "Brittany", "Ashley", "Maria", "Nichole"]
#sample chooses a random one in an array
  baddie = Villain.new(bad_guys.sample)
  puts "#{player.name}, #{baddie.name} would you like to fight or flee?"
  fight_flee = gets.chomp
if fight_flee.downcase == "fight"
  puts "lets fight"
  while baddie.hit_points > 0 && player.hit_points > 0
  puts fight(baddie, player)
  #this does each round of fight every 3 seconds
  sleep 2
  # puts "press enter to continue battle"
  # gets.chomp
  end
elsif fight_flee.downcase == "flee"
  puts "lets flee"
  puts flee(baddie, player)
else
  puts "that not an answer"
end
end #end battle



while player.hit_points > 0
battle(player)
if player.hit_points <= 0
  puts "GAME OVER"
end
end




