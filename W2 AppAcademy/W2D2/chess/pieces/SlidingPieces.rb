module Sliding
    # tmp = []
    # horarr = [0, (0..8).to_a]
    
    HORIZONTAL = [ [0,1], [1,0], [-1, 0], [0, -1] ]
    DIAGONAL = [ [1,1], [1,-1], [-1, 1], [-1, -1] ]
    
    def hor 
        return HORIZONTAL
    end 

    def dia 
        return DIAGONAL 
    end

    def moves_dir(dir)
        
        # movesarr = []
        # dir.each do |i|
        #     movesarr += grow_unblocked_moves_in_dir(i[0], i[1])
        # end
        # movesarr
        return [0,0]
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # (1..).each do |j|
        #     movesarr << [i[0] * j,i[1] * j]
        # end
        # arr = []
        # newpos = pos
        # newpos[0] += dx 
        # newpos[1] += dy
        # while board[newpos].is_a?(NullPiece)
        #     arr << newpos
        #     newpos[0] += dx
        #     newpos[1] += dy
        # end
        # arr

    end

    def row_empty?(pos)
        x,y = pos
        if board.grid[x].count { |i| !i.is_a?NullPiece   } == 1
            return true
        end
    end

    def vertical(pos)
        x,y = pos
        arr = []
        (0..7).each do |i|
            unless board.grid[i][y].is_a?(NullPiece)
                arr << i
            end
        end
    end

    def possmoves(pos)
        arr = []
        (0...pos[1]).to_a.reverse.each do |num| 
            arr << [pos[0],num] if board[[pos[0],num]].is_a?(NullPiece)
            break unless board[[pos[0],num]].is_a?(NullPiece)
        end 
        arr.reverse!
        (pos[1]+1..7).to_a.each do |num| 
            arr << [pos[0],num] if board[[pos[0],num]].is_a?(NullPiece)
            break unless board[[pos[0],num]].is_a?(NullPiece)
        end 
        return arr 
    end

    def vertpossmoves(pos)
        arr = [] 
        (0...pos[0]).to_a.reverse.each do |num| 
            arr << [num,pos[1]] if board[[num,pos[1]]].is_a?(NullPiece)
            break unless board[[num,pos[1]]].is_a?(NullPiece)
        end 
        arr.reverse!
        (pos[0]+1..7).to_a.each do |num| 
            arr << [num,pos[1]] if board[[num,pos[1]]].is_a?(NullPiece)
            break unless board[[num,pos[1]]].is_a?(NullPiece)      
        end 
        return arr 
    end    

    def diagmoves
        arr = []

        upper = 7 - pos[1]

        otherup = 7 - pos[0]

        (1..upper).each do |i|
            -1.downto(otherup).each do |j| 
                if !board[[pos[0] + i,pos[1] + i ]].nil?
                    if !board[[pos[0] + i,pos[1] + i ]].is_a?(NullPiece)
                        arr << [[pos[0] + i,pos[1] + i ]]
                    end
                end
                if !board[[pos[0] + i,pos[1] + i ]].nil?
                    if !board[[pos[0] + i,pos[1] + j ]].is_a?(NullPiece) 
                        arr << [[pos[0] + i,pos[1] + j ]] 
                    end
                end
                if !board[[pos[0] + i,pos[1] + i ]].nil?
                    if !board[[pos[0] + j,pos[1] + j ]].is_a?(NullPiece)  
                        arr << [[pos[0] + j,pos[1] + j ]] 
                    end
                end
                if !board[[pos[0] + i,pos[1] + i ]].nil?
                    if !board[[pos[0] + j,pos[1] + i ]].is_a?(NullPiece) 
                        arr << [[pos[0] + j,pos[1] + i ]] 
                    end
                end
            end
        end
        arr
    end


end

# a.grid[0].count { |i| !i.is_a?NullPiece   }