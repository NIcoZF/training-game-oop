# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts '      -------------------------------------------------'
puts "      |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "      |Le but du jeu est d'être le dernier survivant !|"
puts '      -------------------------------------------------'

# intialisation du jeu

puts '      Quel est ton nom senseï'
print ' > '
user = gets.chomp.to_s
my_game = Game.new(user)

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end
# fin du jeu
my_game.end

