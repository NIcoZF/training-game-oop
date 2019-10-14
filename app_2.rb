# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '-------------------------------------------------'
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts '-------------------------------------------------'

# intialisation du jouer

puts 'Quel est ton nom senseï'
print ' > '
player_1 = gets.chomp.to_s
player_1 = HumanPlayer.new(player_1)

# Créer un array d'ennemis
enemies = []
enemy_1 = Player.new('Josiane')
enemy_2 = Player.new('José')
enemies << enemy_1 << enemy_2

while player_1.life_points > 0 && (enemy_1.life_points > 0 || enemy_2.life_points > 0)
  puts player_1.show_state.to_s

  puts "Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner

  attaquer un joueur en vue :
  0 - Josiane a #{enemy_1.life_points} points de vie
  1 - José a #{enemy_2.life_points} points de vie"

  type = gets.chomp.to_s

  case type
  when "a"
    player_1.search_weapon
  when "s"
    player_1.search_healt_pack
  when "0"
    player_1.attacks(enemy_1)
  when "1"
    player_1.attacks(enemy_2)
    end
  puts '                            '  
  puts 'Les autres joueurs attaquent'
  puts '                            '  

  enemies.each do |enemy|
    next if enemy.life_points <= 0
    enemy.attacks(player_1)
  end
end

puts 'La partie est finie'
  if player_1.life_points > 0
    puts 'BRAVO ! TU AS GAGNE !'
  else
    puts 'Loser ! Tu as perdu !'
  end