module Stepping 

    def moves_stepping 
        kingarr = [0,1,-1,1,-1].permutation(2).to_a.uniq
        kniarr = [2,-2].product([-1,1])
        kniarr += kniarr.map(&:reverse)
        return [kingarr, kniarr]
    end
end