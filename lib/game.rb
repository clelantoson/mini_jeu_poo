class Game
attr_accessor :human_player, :ennemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    player1 = Player.new("Josiane")
    player2 = Player.new("José") 
    player3 = Player.new("Jeanette")  
    player4 = Player.new("Julie")  
    @ennemies = [player1, player2, player3, player4]
  end

  def kill_player(player)
  return @ennemies.delete(player)
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @ennemies.any?
      return true
    else
      return false
    end
  end

  def show_players
   puts "Tu es #{@human_player.show_state} et il reste #{@ennemies.length} ennemis."
  end 
  def menu 
    puts "Quelle action veux-tu effectuer ?\n\n"

    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner\n\n"
    
    puts "attaquer un joueur en vue :"

    @ennemies.each_with_index do |ennemi, index|
    puts "#{index} - #{ennemi.name} a #{ennemi.show_state} points de vie"
    end
  end

  def menu_choice
    user_answer = gets.chomp

    if user_answer == "a" 
      @human_player.search_weapon
    elsif user_answer == "s"
      @human_player.search_health_pack
    elsif user_answer == "0"
      @human_player.attacks(player1)
    elsif user_answer == "1"
      @human_player.attacks(player2)
    elsif user_answer == "3"
      @human_player.attacks(player3)
    elsif user_answer == "4"
      @human_player.attacks(player4)
    else 
      puts "Error, please type again."
    end
  end
end