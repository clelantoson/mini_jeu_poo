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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    super
    puts "#{self.name} a #{self.life_points} points de vie, avec une arme de niveau #{@weapon_level}"  
  end

  def compute_damage
    rand(1..6) * @weapon_level
    super
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youpiyoup ! Elle est meilleure que ton arme actuelle : tu la prends. Ton arme est maintenant de niveau #{@weapon_level}."
    else 
      puts "Sh*t... elle n'est pas mieux que ton arme actuelle...relâche la."
    end
  end

  def search_health_pack
    result = rand(1..6)
    if result >= 2 && result <= 5
      @life_points += 50 
     @life_points = @life_points.clamp(0, 100)
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! Tu as maintenant #{@life_points} PV."
    elsif 
      result == 6
      @life_points += 80 
      @life_points = @life_points.clamp(0, 100)
      puts "Bravo, tu as trouvé un pack de +80 points de vie ! Tu as maintenant #{@life_points} PV."
    else 
      puts "Tu n'as rien trouvé."
    end
  end

end


