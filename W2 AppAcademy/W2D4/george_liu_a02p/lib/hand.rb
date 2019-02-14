class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end


  BLACKJACK_VALUE = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10
  }

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    cards.each do |card|
      sum += BLACKJACK_VALUE[card.value] unless card.value == :ace
      sum += 11 if card.value == :ace
    end 
    ace_count = 0
    cards.each {|card| ace_count += 1 if card.value == :ace} 
    ace_count.times do 
      if sum > 21 
        sum -= 10 
      end 
    end
    return sum
  end

  def busted?
    return self.points > 21
  end

  def hit(deck)
    raise 'already busted' if self.busted?
    cards.concat(deck.take(1))
  end

  def beats?(other_hand)
    return false if self.busted?
    return true if other_hand.busted?
    return self.points > other_hand.points
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
