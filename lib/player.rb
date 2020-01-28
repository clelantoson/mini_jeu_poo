# n joueur possède 2 attributs que tu vas mettre en attr_accessor : un nom @name (string) et un niveau de vie @life_points (integer).

# Quand on veut créer un objet Player, on ne met que son nom en entrée car le niveau de vie est le même pour tout le monde au début
#  (10 pts de vie). 
# cris la méthode initialize afin qu'on ait la réaction suivante si on lance app.rb et qu'on utilise PRY :


class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    return self.life_points
  end

  def gets_damage(damage_received)
    @life_points -= damage_received
    if @life_points <= 0
      puts "#{@name} a été tué !"
    else 
      nil
    end
  end

  def attacks(player_to_attack)
    puts "le joueur #{@name} attaque le joueur #{player_to_attack.name}"
    damages = compute_damage
    player_to_attack.gets_damage(damages)
    puts "il lui inflige #{damages} points de dommages."
  end

  def compute_damage
    return rand(1..6)
  end
end
