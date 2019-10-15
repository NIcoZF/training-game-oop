# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '      -------------------------------------------------'
puts "      |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "      |Le but du jeu est d'être le dernier survivant !|"
puts '      -------------------------------------------------'

# intialisation du jouer

puts '      Quel est ton nom senseï'
print ' > '
user = gets.chomp.to_s
user = HumanPlayer.new(user)

# Créer un array d'ennemis
enemies = []
enemy1 = Player.new('Josiane')
enemy2 = Player.new('José')
enemies << enemy1 << enemy2

while user.life_points.positive? && (enemy1.life_points.positive? || enemy2.life_points.positive?)
  puts '                      '
  puts user.show_state.to_s

  puts "      Quelle action veux-tu effectuer ?

        a - chercher une meilleure arme
        s - chercher à se soigner

        attaquer un joueur en vue :
        0 - Josiane a #{enemy1.life_points} points de vie
        1 - José a #{enemy2.life_points} points de vie"

  type = gets.chomp.to_s

  puts '                                  '
  puts '      Les autres joueurs attaquent'
  puts '                                  '

  enemies.each do |enemy|
    next if enemy.life_points <= 0
    enemy.attacks(user)
  end
end

puts '      La partie est finie'
if user.life_points.positive?
  puts '      BRAVO ! TU AS GAGNE !'
else
  puts '      Loser ! Tu as perdu !'
end
