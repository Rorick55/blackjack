require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require 'pry'


class BlackjackGame
  def initialize(players_hand, dealers_hand, deck)
    @players_hand = players_hand
    @dealers_hand = dealers_hand
    @deck = deck
  end


  def bust?(hand)
    if hand > 21
      true
    else
      false
    end
  end

  def begin_game
    puts "Welcome to Blackjack!"
    puts
    @players_hand.add_card(@deck)
    @players_hand.add_card(@deck)
    @dealers_hand.add_card(@deck)
    @dealers_hand.add_card(@deck)
    puts "Player was delt #{@players_hand.first_card.show_card}"
    puts "Player was delt #{@players_hand.last_card.show_card}"
    puts "Players Score: #{@players_hand.score}"
  end

  def hit_or_stay
    puts "Hit or stay?"
    respond = gets.chomp.downcase
    while respond == 'h'
      @players_hand.add_card(@deck)
      puts "Player was delt #{@players_hand.last_card.show_card}"
      puts "Players Score: #{@players_hand.score}"
      if bust?(@players_hand.score)
        puts "Bust!"
         break
      end
      puts
      puts "Hit or stay?"
      respond = gets.chomp.downcase
    end
  end

  def end_game
    if @players_hand.score <= 21
      puts
      puts "Dealer was delt #{@dealers_hand.first_card.show_card}"
      puts "Dealer was delt #{@dealers_hand.last_card.show_card}"
      puts "Dealer's Score: #{@dealers_hand.score}"
      puts
      while @dealers_hand.score < 17
        @dealers_hand.add_card(@deck)
        puts "Dealer was delt #{@dealers_hand.last_card.show_card}"
        puts "Dealer Score: #{@dealers_hand.score}"
        if bust?(@dealers_hand.score)
          puts "Bust!"
           break
        end
        puts
      end

      if @dealers_hand.score <= 21
        if @dealers_hand.score < @players_hand.score
          puts "You win!"
        elsif @dealers_hand.score > @players_hand.score
          puts "You lose!"
        else
          puts "Tie! You keep your money!"
        end
      else
        puts "You win!"
      end
    else
      puts "You lose!"
    end
  end
end


