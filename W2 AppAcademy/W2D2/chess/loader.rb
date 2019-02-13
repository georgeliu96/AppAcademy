require_relative 'Board.rb'

a = Board.new
# b = Knight.new([3,4],1,a)
# a.add_piece(b, [3,4])
# c = Knight.new([2,2],1,a)
# a.add_piece(c, [2,2])

# d = Knight.new([4,6],0,a)
# a.add_piece(d, [4,6])
# # e.render
# # p c.moves
# # p c.valid_moves

# q = King.new([5,6],0,a)
# a.add_piece(q, [5,6])
# z = Knight.new([5,7],1,a)
# a.add_piece(z, [5,7])



# p q.moves
# p q.valid_moves

# e.render


d = Bishop.new([4,6],1,a)
a.add_piece(d, [4,6])
# tt = Pawn.new([5,7],0,a)
# a.add_piece(tt, [5,7])

# p d.possmoves([4,6])
# p d.vertpossmoves([4,6])
p d.moves

p d.diagmoves

e = Display.new(a)
e.render
