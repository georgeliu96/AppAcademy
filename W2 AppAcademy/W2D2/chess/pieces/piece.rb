require 'colorize'



class Piece 

    attr_accessor :pos, :symbol
    attr_reader :color, :board 
    
    
    def initialize(pos, color_idx, board)
        colarr = [:white,:black]
        @pos = pos
        @symbol = self.symbol_array[color_idx].colorize(:yellow) if color_idx == 1
        @symbol = self.symbol_array[color_idx].colorize(:red) if color_idx == 0
        @color = colarr[color_idx]
        @board = board 
    end

    def valid_moves
        poss = self.moves
        poss = poss.map { |i| i = [pos[0] + i[0], pos[1] +i[1] ] }
        poss = poss.select {|el| board.valid_pos?(el)  && !ally_piece?(el)}

    end

    def ally_piece?(pos)
        # p board[pos].class
        return true if board[pos].color == self.color 
        return false 
    end



end 

# a = Board.new
# b = Knight.new([3,4],1,a)
# c = Knight.new([2,2],1,a)
# d = Knight.new([4,6],0,a)
# c.valid_moves
