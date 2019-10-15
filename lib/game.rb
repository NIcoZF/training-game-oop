# frozen_string_literal: true

class Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    player1 = Player.new('José')
    player2 = Player.new('Josiane')
    player3 = Player.new('Joséfo')
    player4 = Player.new('Josiano')
    @enemies = []
    @enemies << player1 << player2 << player3 << player4
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    if @human_player.life_points.positive? && !@enemies.empty?
      return true
    else
      return false
    end
  end

  def show_players
    puts "\n      -------------------------------------------------"
    puts "      1- Le jouer #{@human_player.name} a #{@human_player.life_points} points de vie"
    puts "      2- Il reste #{@enemies.length} bots à combattre"
    puts '      -------------------------------------------------'
  end

  def menu
    puts " \n Quelle action veux-tu effectuer ?

        a - chercher une meilleure arme
        s - chercher à se soigner

    \n attaquer un joueur en vue :"
          @enemies.each_with_index do |player, i|
          puts "     #{i} - #{player.name} a #{player.life_points} points de vie" if player.life_points.positive?
    end
  end

  def menu_choice
    print " >               "
    string = gets.chomp.to_s
    case string
    when 'a'
      @human_player.search_weapon
    when 's'
      @human_player.search_healt_pack
    when '0'
      @human_player.attacks(@enemies[0])
    when '1'
      @human_player.attacks(@enemies[1])
    when '2'
      @human_player.attacks(@enemies[2])
    when '3'
      @human_player.attacks(@enemies[3])
    end
      @enemies.each do |player|
         kill_player(player) if player.life_points <= 0
      end
  end

  def enemies_attack
    enemies.each do |enemy|
      next if enemy.life_points <= 0
      enemy.attacks(@human_player)
    end
  end

  def end
    puts "\n      La partie est finie"
    if @human_player.life_points.positive?
      puts '      BRAVO ! TU AS GAGNE !'
    else
      puts '      Loser ! Tu as perdu !'
    end
  end
end

