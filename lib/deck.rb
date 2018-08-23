require_relative "card"

class Deck
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
  SUITS = ["♠", "♥", "♦", "♣"]

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end

  def deal
    @cards.pop
  end
end
