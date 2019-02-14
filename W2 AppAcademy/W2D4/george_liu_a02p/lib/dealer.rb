require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = Hash.new{|h,k| h[k] = 0}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until self.hand.points >= 17 || self.hand.busted? 
      self.hand.hit(deck)
    end 
  end

  def take_bet(player, amt)
    self.bets[player] += amt
  end

  def pay_bets
    self.bets.each do |player, amt| 
      if player.hand.beats?(self.hand)
        player.pay_winnings(amt * 2)
        bets[player] = 0 
      else 
        bets[player] = 0 
      end 
    end
  end
end
