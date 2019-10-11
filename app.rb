# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')

while player1.life_points > 0 && player2.life_points > 0
puts '                                '
puts '          =========             '
puts '    ====================        '
puts '================================'
puts "Voici l'etat de chaque joueur:"
puts "Joueur 1 : #{player1.name}"
player1.show_state.to_s
puts '================================'
puts '    ====================        '
puts '          =========             '
puts '                                '
puts '          =========             '
puts '    ====================        '
puts '================================'
puts "Voici l'etat de chaque joueur:"
puts "Joueur 2 : #{player2.name}"
player2.show_state.to_s
puts '================================'
puts '    ====================        '
puts '          =========             '
puts '                                '
puts 'Hajime !!'
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
end

# binding.pry
