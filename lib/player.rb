# frozen_string_literal: true

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "Il reste #{life_points} points de vie à l'ami #{name}"
  end

  def gets_damage(strike)
    self.life_points -= strike
    if self.life_points <= 0
      puts "Le joueur #{name} a été tué"
      puts '         ===============       '
    end
  end

  def attacks(player)
    puts '                                '
    puts "le joueur #{name} attaque le joueur #{player.name}"
    puts '                                '
    hit = compute_damage
    player.gets_damage(compute_damage)
    puts "il lui inflige #{hit} points de dommages"
  end

  def compute_damage
    rand(1..6)
  end
end
