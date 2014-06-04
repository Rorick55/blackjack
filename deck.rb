require_relative 'card'
require 'pry'

class Deck
  def initialize
    @suit = ["♠", "♥", "♣", "♦"]
    @rank = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "K", "Q", "A"]
    @deck = deck.shuffle
  end


  def deck
    deck = []
    @suit.each do |suit|
      @rank.each do|value|
       deck << Card.new(value, suit)
     end
   end
   deck
 end

 def shuffle
  @deck.shuffle!
  end

  def deal
    card = @deck.pop
  end

  def length
    @deck.length
  end
end
