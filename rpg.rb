intro = ["Welcome the the Game!",
"The object of the game is to get through the forest.",
"You need fight bad guys to get through to forest!",
"You must go 100 miles to get though the forest.",
"Every bad guy you encounter will get you farther or set you back",
"Choose your battle carefully because you don't want to lose all your hit points"]

intro.each {|each| 
  puts each.upcase
  sleep 1}

puts "What is your name?"

class Hero
  attr_accessor :name, :hit_points, :hit_chance, :miles
  def initialize(name)
    @name = name
    @hit_points = 10
    @hit_chance = 50
    @miles = 100
  end
end

player_name = gets.chomp.capitalize

player = Hero.new(player_name)

puts "#{player.name} enters the forest!" 
sleep 1
puts "Hi #{player.name}, Prepare for battle!"
sleep 1

class Villain
  attr_accessor :name, :hit_points, :hit_chance, :miles
  def initialize(name)
    @name = name
    @hit_points = rand(1..7)# 1-8 hit points#6
    @hit_chance = rand(1..60)#1-90% chance hit chance#60
    @miles = rand(10..30) #how many miles you gain if you pass this villian 0-25
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
    puts '           ||'
    puts ' _         )( ______________________'
    puts '(_)///////(**)______________________>'
    puts '           )('
    puts '           ||'
    puts "#{player.name} loses #{b_points} points"
  else
    puts "#{baddie.name} missed"
    baddie.hit_chance-=2 #adds 2% to baddie if successful hit
  end
end
end #end while
  #player wins
  if baddie.hit_points <= 0 && player.hit_points >= 0
    player.hit_points += 1
    player.miles -= baddie.miles
    puts "#{player.name} wins!"
  end
  #baddie wins
  if player.hit_points <= 0 && player.hit_points >= 0
    puts "#{baddie.name} wins! Game Over"
  end

end #end fight
###############

#############
### flee method, passed into battle method
def flee(baddie, player, flee_points, flee_miles)
  puts "#{player.name} runs away from #{baddie.name}."
  sleep 1
  player.hit_points-=flee_points
  player.miles+=flee_miles
end #end flee


############
### initiates a battle with the 
def battle(player)
  adjectives = ["Uncanny", "Crawly", "Mysterious", "Shadowy", "Beastly", "Grim", "Unholy",
  "Horrid", "Hideous"]

   bad_guys = ["Cockatrice", "Count Dracula", "Doppelganger", "Echidna", "Elf", "Dragon", 
  "Demon", "Cyclops", "Ghost", "Grim Reaper", "Manticore", "Mutants", "New Jersey Devil", 
  "Pegasus", "Sasquatch", "Satyr", "Siren", "Vampire", "Zombie", "Sea-Goat"]

  flee_points = rand(2..4)
  flee_miles = rand(10..25)
#sample chooses a random one in an array
  baddie = Villain.new(adjectives.sample + " " + bad_guys.sample)
  puts "You encounter a #{baddie.name}, it has #{baddie.hit_points} hit points, a #{baddie.hit_chance}% hit success, and give you #{baddie.miles} miles off your journey. "
  sleep 1
  puts "You have #{player.hit_points} hit points, #{player.hit_chance}% hit chance, and #{player.miles} miles to go on your journey."
  sleep 1

round = true
  while round == true
    puts "Would you like to fight #{baddie.name}? or flee for #{flee_points} hit points and #{flee_miles} miles from you journey?"
    fight_flee = gets.chomp
    if fight_flee.downcase == "fight"
      puts fight(baddie,player)
      round = false
    elsif fight_flee.downcase == "flee" 
        if player.hit_points <= flee_points
          puts "You don't have enough hit points to flee, you must fight."
        elsif player.miles + flee_miles > 100
          puts "You cannot flee, you're too close to home, you must fight."
        else #player.hit_points >= flee_points+1
          puts flee(baddie, player, flee_points, flee_miles)
          round = false
        end
    else
      puts "that not an answer"
    end # end main if
  end #end while
end #end battle method



while player.hit_points > 0 && player.miles > 0
battle(player)
  if player.miles <= 0
    puts "CONGRADULATIONS"
    sleep 1
    puts "You've completed your mission through the forest"
    puts "You've completed 100 miles."
  end
  if player.hit_points <= 0
    puts "You lost all you're hit points"
    puts "GAME OVER"
  end
end





