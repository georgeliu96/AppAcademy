require_relative "deck"
require_relative "hand"

class Player
  attr_reader :name, :bankroll, :deck
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = name 
    @bankroll = bankroll
    @deck = Deck.new
    @hand = Hand.new(deck)
  end

  def pay_winnings(bet_amt)
    self.bankroll += bet_amt
  end

  def return_cards(deck)
    self.hand.return_cards(deck)
    self.hand = nil
  end

  def place_bet(dealer, bet_amt)
    dealer.take_bet(self, bet_amt)
    raise "player can't cover bet" if bet_amt > self.bankroll
    self.bankroll -= bet_amt
  end

  private 
  attr_writer :bankroll
end
