require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
    SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }




  def self.all_cards
    deck = []
    SUIT_STRINGS.each do |suit, suitstr| 
      VALUE_STRINGS.each do |value, valstr|
        deck << Card.new(suit, value)
      end 
    end 
    return deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards 
  end

  # Returns the number of cards in the deck.
  def count
    return cards.length 
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    if n > self.count 
      raise 'not enough cards'
    end 
    ncards = [] 
    n.times do 
      ncards << cards.shift
    end 
    return ncards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(newcards)
    newcards.each do |newc|
      cards.push(newc)
    end 
  end

  private
  attr_reader :cards
end
