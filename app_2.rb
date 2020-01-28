require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
def choose_name
  puts "Quel est ton petit nom ?"
  return player = gets.chomp 
end

def init_name
  user = HumanPlayer.new(choose_name)
  puts "Bienvenue #{user.name}"
  return user
end

def create_ennemies
player1 = Player.new("Josiane")
player2 = Player.new("José")  
ennemies = [player1, player2]
return ennemies
end

def party_is_over(user)
  puts "La partie est finie"
  if user.life_points > 0 
    puts "BRAVO TU ES EN VIE !"
  else 
    puts "LOSER! T'ES MORT"
  end
end

user = init_name
ennemies = create_ennemies
player1 = ennemies[0]
player2 = ennemies[1]
while user.life_points > 0 && ( player1.life_points > 0 || player2.life_points > 0 )
  user.show_state
  puts "Quelle action veux-tu effectuer ?\n\n"

  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner\n\n"
  
  puts "attaquer un joueur en vie :"
  puts "0 - #{player1.name} a #{player1.show_state} points de vie" if player1.life_points > 0
  puts  "1 - #{player2.name} a #{player2.show_state} points de vie" if player2.life_points > 0

  user_answer = gets.chomp

  if user_answer == "a" 
    user.search_weapon
  elsif user_answer == "s"
    user.search_health_pack
  elsif user_answer == "0"
    user.attacks(player1)
  elsif user_answer == "1"
    user.attacks(player2)
  else 
    puts "Error, please type again."
  end

  puts "Les autres joueurs t'attaquent !"

  ennemies.each do |ennemi|
    if ennemi.life_points > 0
      ennemi.attacks(user)
    else
      puts "#{ennemi.name} n'est pas un zombie, il ne peut pas attaquer."
    end
  end


end

party_is_over(user)