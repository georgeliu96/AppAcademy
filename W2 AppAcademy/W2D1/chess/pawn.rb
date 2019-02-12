require_relative "Piece"

class Pawn < Piece

    def moves
        arr = []
        if self.pos[1] == 1
            arr += [[self.pos[0] , self.pos[1 ]+ 2]]
        end
        arr += [[self.pos[0], self.pos[1] + 1]]
        arr
    end

end