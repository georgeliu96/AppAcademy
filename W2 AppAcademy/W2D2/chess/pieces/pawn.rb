require_relative "Piece"

class Pawn < Piece
    attr_reader :symbol_array

    def initialize(pos , color_idx, board)
        @symbol_array = ['♙' ,'♟']	
        super(pos , color_idx, board)
    end 

    def move_dirs 
        return -1 if color == :white 
        return 1 if color == :black 
    end 

    def at_start_row? 
        return true if color == :white && pos[0] == 1 
        return true if color == :black && pos[0] == 6 
        return false 
    end 

    def diagattacks(i)        
        if !board[[pos[0] + move_dirs, pos[1] + i ]].is_a?(NullPiece)
            if board[[pos[0] + move_dirs,pos[1] + i ]].color != self.color
                return [pos[0] + move_dirs,pos[1] + i ]
            end
        end
    end


    def moves
        arr = []
        if at_start_row? 
            arr += [[self.pos[0] + (move_dirs * 2), self.pos[1 ]]]
        end
        arr += [[self.pos[0] +move_dirs, self.pos[1] ]]
        arr << diagattacks(1) unless diagattacks(1).nil?
        arr << diagattacks(-1) unless diagattacks(-1).nil?
        arr
    end

end