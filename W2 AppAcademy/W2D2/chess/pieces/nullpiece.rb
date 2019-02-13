require "Singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :symbol


    def initialize()
        @symbol = " "
        @color = :gray
    end 

    def moves 
        [] 
    end 
end 