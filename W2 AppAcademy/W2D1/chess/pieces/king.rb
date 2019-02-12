require_relative 'piece.rb'
require_relative 'SteppingPieces'
class King < Piece

    attr_reader :symbol_array
    include Stepping 

    def initialize(pos , color_idx)
        @symbol_array = ['♔' ,'♚']	
        super(pos , color_idx)
    end 

    def moves 
        return moves_stepping [0]
    end 
end