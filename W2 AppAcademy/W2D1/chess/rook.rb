require_relative "SlidingPieces"
require_relative "Pieces"


class Rooks < Piece
    include Sliding

    def intialize
        symbol = [♖, ♜]