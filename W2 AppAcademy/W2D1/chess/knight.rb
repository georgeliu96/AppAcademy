class Knight.rb

    @symbol = ♘

    def moves
        a = [2,-2].product([-1,1])
        a += a.map(&:reverse)


    end

