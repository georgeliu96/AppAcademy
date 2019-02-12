require_relative "piece"
require_relative "nullpiece"
# require_relative "display"


class Board 

    attr_reader :grid


    def initialize
        @grid = Array.new(8){Array.new(8)}
        @grid[0] = @grid[0].each.with_index.map do |place, i| 
            place = Piece.new([0,i])
        end
        @grid.each.with_index.map do |sub, i2| 
            sub.each.with_index.map do |el, i3|
                @grid[i2][i3] = NullPiece.new([i2,i3]) unless i2 == 0
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
  
    def [] (pos) 
        x,y = pos
        return @grid[x][y]
    end

    def []= (pos, val)
        x,y = pos
        @grid[x][y] = val
    end 

    def render(curr_pos)
        grid.each do |sub| 
            sub.each do |el| 
                print "[ " 
                print "•".colorize(:blue) if (self[curr_pos] == el) && !el.is_a?(NullPiece)
                print "•".colorize(:red) if !(self[curr_pos] == el) && !(el.is_a? NullPiece)   
                print "x".colorize(:blue) if el.is_a?(NullPiece) && (self[curr_pos] == el)
                # print " && " if self[curr_pos] == el
                print " ]"
            end 
            puts 
        end 
    end
end 

a = Board.new

