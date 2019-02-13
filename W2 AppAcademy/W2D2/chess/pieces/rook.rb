require_relative "SlidingPieces"
require_relative "piece"

class Rook < Piece

    attr_reader :symbol_array

    include Sliding


    def initialize(pos , color_idx, board)
        @symbol_array = ['♖', '♜'] 
        super(pos , color_idx, board)
    end 

    def moves
        return moves_dir(hor)
    end 

end