require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'blackjackgame'
require 'pry'



deck_of_cards = Deck.new
players_hand = Hand.new
dealers_hand = Hand.new

new_game = BlackjackGame.new(players_hand, dealers_hand, deck_of_cards)

new_game.begin_game

new_game.hit_or_stay

new_game.end_game
