# frozen_string_literal: true

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "Il reste #{@life_points} points de vie à l'ami #{@name}"
  end

  def gets_damage(strike)
    @life_points -= strike
    if @life_points <= 0
      puts "Le joueur #{name} a été tué"
      puts '         ===============       '
    end
  end

  def attacks(player)
    puts '                                '
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    puts '                                '
    hit = compute_damage
    player.gets_damage(compute_damage)
    puts "il lui inflige #{hit} points de dommages"
  end

  def compute_damage
    rand(1..6)
  end
end

##############################################################################

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    super(name)  # The order of super seemingly matters
    @weapon_level = 1
    @life_points = 100

  end

  def show_state
    puts "Le joueur #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    weapon_found = dice
    puts "Tu as trouvé une arme de niveau #{weapon_found}"
    if weapon_found > @weapon_level
      @weapon_level = weapon_found
      puts ' Youhou tu viens de trouver une meilleure arme'
    else
      puts "Mauvaise pioche elle n'est pas mieux que ton arme actuelle"
    end
  end

  def search_healt_pack
    dice = rand(1..6)
    case dice
    when 1
      puts "Tu n'as rien trouvé"
    when 2..5
      @life_points <= 50 ? @life_points += 50 : @life_points = 100
      puts 'Bravo du as trouvé un pack de +50pts de vie'
    when 6
      @life_points <= 20 ? @life_points += 80 : @life_points = 100
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
    end
  end
end