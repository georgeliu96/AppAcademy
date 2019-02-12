require "byebug"

class Board
  attr_accessor :cups, :name1, :name2 

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    self.place_stones
    @name1 = name1 
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each.with_index do |el, i| 
      4.times do 
        cups[i] << :stone unless i == 6 || i == 13
      end 
    end 
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0
      raise 'Invalid starting cup'
    elsif cups[start_pos].length == 0
      raise 'Starting cup is empty'
    else 
      return true
    end
  end

  def make_move(start_pos, current_player_name)
    # debugger
    count = cups[start_pos].length 
    cups[start_pos] = []
    first = (start_pos + 1) % 14 
    last = (start_pos + count) % 14 
    changecups = cups[first..last] unless first > last 
    changecups = cups[first..-1] + cups[0..last] if first > last
    changecups.each.with_index do |cup,i| 
      index = (i + first) % 14
      if current_player_name == name1 
        cups[index] << :stone unless index == 13
        if index == 13
          last = (last + 1) % 14 
          cups[last] << :stone
        end
      else 
        cups[index] << :stone unless index == 6
        if index == 6
          last = (last + 1) % 14 
          cups[last] << :stone 
        end
      end
    end
    self.render
    return next_turn(last)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13 
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx 
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return (cups[0..5].all? {|cup| cup.empty?}) || (cups[7..12].all? {|cup| cup.empty?})
  end

  def winner
    # debugger
    return name1 if cups[6].length > cups[13].length 
    return name2 if cups[13].length > cups[6].length
    return :draw 
  end
end
