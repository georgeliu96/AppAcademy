require "colorize"
require_relative "cursor.rb"
require_relative "Board"

class Display 
    attr_reader :board, :cursor 

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def render 
        
        # system "clear"
        # while true
            board.render(@cursor.cursor_pos)
            p cursor.cursor_pos
            cursor.get_input
            # system "clear"

        # end 
    end 
end 

# b = Board.new
# a = Display.new(b)
# a.render
