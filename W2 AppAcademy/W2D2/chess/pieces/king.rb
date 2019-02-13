require_relative 'piece.rb'
require_relative 'SteppingPieces'
class King < Piece

    attr_reader :symbol_array
    include Stepping 

    def initialize(pos , color_idx, board)
        @symbol_array = ['♔' ,'♚']	
        super(pos , color_idx, board)
    end 

    def moves 
        all_moves = moves_stepping
        return all_moves[0]
    end 
end