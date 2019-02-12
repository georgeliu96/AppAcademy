require_relative 'piece.rb'
require_relative 'SlidingPieces'
class Queen < Piece
    attr_reader :symbol_array
    include Sliding

    def initialize(pos , color_idx)
        @symbol_array = ['♕' ,'♛']	
        super(pos , color_idx)
    end 

    def move_dirs(dir) 
        return moves(hor + dia)
    end 

end