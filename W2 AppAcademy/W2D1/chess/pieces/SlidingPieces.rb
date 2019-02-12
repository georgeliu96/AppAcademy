module Sliding
    # tmp = []
    # horarr = [0, (0..8).to_a]
    
    hor = [ [0,1], [1,0], [-1, 0], [0, -1] ]
    dia = [ [1,1], [1,-1], [-1, 1], [-1, -1] ]
    
    def moves_dir(dir)
        
        movesarr = []
        dir.each do |i|
            movesarr += grow_unblocked_moves_in_dir(i[0], i[1])
        end
        movesarr
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # (1..).each do |j|
        #     movesarr << [i[0] * j,i[1] * j]
        # end
        arr = []
        newpos = pos
        while board[newpos].is_a?(NullPiece)
            newpos[0] += dx
            newpos[1] += dy
            arr << newpos
        end
        if board[newpos].color == board[pos].color
            arr.pop
        end
        arr

    end

end