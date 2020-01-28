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
  gets.chomp = player
end

def init_name
  human_player1= HumanPlayer.new("player")
  puts "Bienvenue #{human_player1.name}"
end

def create_ennemies
player1 = Player.new("Josiane")
player2 = Player.new("José")  
ennemies = [player1, player2]
return ennemies
end

while human_player1.life_points >= 0 && player1 >= 0 || player2 >= 0
else break
end
 
def party_is_over
  puts "La partie est finie"
  if human_player1.life_points > 0 
    puts "BRAVO TU ES EN VIE !"
  else 
    "LOSER! T'ES MORT"
  end
end