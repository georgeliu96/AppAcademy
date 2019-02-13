require_relative "pieces.rb"
require_relative "display"
require "colorize"

class Board 

    attr_reader :grid


    def initialize
        @grid = Array.new(8){Array.new(8)}
        self[[0,0]] = Rook.new([0,0],1, self)
        self[[0,7]] = Rook.new([0,7],1, self)
        self[[0,1]] = Knight.new([0,1],1, self)
        self[[0,6]] = Knight.new([0,6], 1, self)
        self[[0,2]] = Bishop.new([0,2],1, self)
        self[[0,5]] = Bishop.new([0,2],1, self)
        self[[0,3]] = King.new([0,3],1, self)
        self[[0,4]] = Queen.new([0,4],1, self)
        @grid[1].each.with_index do |tile, i| 
            self[[1,i]] = Pawn.new([1,i],1, self)
        end
        self[[7,0]] = Rook.new([7,0],0, self)
        self[[7,7]] = Rook.new([7,7],0, self)
        self[[7,1]] = Knight.new([0,1],0, self)
        self[[7,6]] = Knight.new([7,6], 0, self)
        self[[7,2]] = Bishop.new([7,2],0, self)
        self[[7,5]] = Bishop.new([7,2],0, self)
        self[[7,4]] = King.new([7,4],0, self)
        self[[7,3]] = Queen.new([7,3],0, self)
        @grid[6].each.with_index do |tile, i| 
            self[[6,i]] = Pawn.new([6,i],0, self)
        end
        @grid.each_with_index do |sub, i1| 
            sub.each_with_index do |el, i2| 
                self[[i1,i2]] = NullPiece.instance if el.nil?
            end 
        end
        # @cursor = Cursor.new([0,0], self)
        # @display = Display.new(self)
        # grid.each_with_index {|i, ind| i.each_with_index {|j, ind2| @grid[[ind,ind2]] = Piece.new([[ind,ind2]]) }    }
    end

    def move_piece(start_pos, end_pos)
        self[start_pos].pos, self[end_pos].pos = end_pos, start_pos
        self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
    end 

  
    def add_piece(piece,pos)
        self[pos] = piece 
    end 

    def find_king(color)
        grid.each_with_index do|sub, i1| 
            sub.each_with_index do |el, i2| 
                return [i1,i2] if el.is_a? King && el.color == color 
            end 
        end 
    end 

    def pieces 
       sum = 0 
        grid.each_with_index do|sub, i1| 
            sub.each_with_index do |el, i2| 
                sum += 1 unless el.is_a? NullPiece
            end 
        end 
        return sum 
    end

    def [] (pos) 
        x,y = pos
        return @grid[x][y]
    end

    def []= (pos, val)
        x,y = pos
        @grid[x][y] = val
    end 

    def dup 
        colorhash = {white: 0, black: 1}
        dupped = Board.new 
        dupped.grid.each_with_index do|sub, i1| 
            sub.each_with_index do |el, i2| 
                old_piece = self[[i1,i2]]
                dupped[[i1,i2]] = old_piece.class.new([[i1,i2]],colorhash[old_piece.color]) unless old_piece.is_a? NullPiece 
                dupped[[i1,i2]] = NullPiece.instance if old_piece.is_a? NullPiece
             end 
        end 
        return dupped 
    end 

    def render(curr_pos)
        grid.each.with_index do |sub, i1| 
            sub.each.with_index do |el, i2| 
                tile = self[[i1,i2]]
                print "[ " 
                print tile.symbol.colorize(:blue) if (tile == el) && !el.is_a?(NullPiece) && [i1,i2] == curr_pos
                print tile.symbol if (tile == el)  && [i1,i2] != curr_pos
                print "x".colorize(:blue) if (tile == el) && [i1,i2] == curr_pos && el.is_a?(NullPiece)
                # print " && " if self[curr_pos] == el
                print " ]"
            end 
            puts 
        end 
    end

    def valid_pos? (pos)
        pos.all? {|i| i >= 0 && i < 8  }
        # valid = (0..7).to_a
        # return pos.all? {|el| valid.include?(el)} && self[pos].is_a?(NullPiece)
    end 
end 

a = Board.new

