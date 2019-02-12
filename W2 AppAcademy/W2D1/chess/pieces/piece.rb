require 'colorize'
require_relative '../board.rb'
class Piece 

    attr_accessor :pos, :symbol
    attr_reader :color 
    
    COLARR = [:white,:black]
    def initialize(pos, color_idx)
        @pos = pos
        @symbol = self.symbol_array[color_idx].colorize(:yellow) if color_idx == 1
        @symbol = self.symbol_array[color_idx].colorize(:red) if color_idx == 0
        @color = COLARR[color_idx]
    end

    def moves
        # self.class.moves
        # dolater
        # map
        # add arrays together pos
    end


end 