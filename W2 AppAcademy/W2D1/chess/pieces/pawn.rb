require_relative "Piece"

class Pawn < Piece
    attr_reader :symbol_array

    def initialize(pos, color_idx)
        @symbol_array = ['♙' ,'♟']	
        super(pos, color_idx)
    end 



    def moves
        arr = []
        if self.pos[1] == 1
            arr += [[self.pos[0] , self.pos[1 ]+ 2]]
        end
        arr += [[self.pos[0], self.pos[1] + 1]]
        arr
    end

end