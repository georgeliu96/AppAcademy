require_relative "SlidingPieces"
require_relative "piece"

class Rook < Piece

    attr_reader :symbol_array

    include Sliding

    rook_dirs = [[1,0], [0,1], ]

    def initialize(pos , color_idx)
        @symbol_array = ['♖', '♜'] 
        super(pos, color_idx)
    end 

    def moves
        return moves_dir(hor)
    end 

end