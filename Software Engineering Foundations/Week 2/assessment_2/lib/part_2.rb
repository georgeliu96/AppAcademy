def proper_factors (n)
    (1...n).select {|x| n % x == 0}
end 

def aliquot_sum (n)
    return proper_factors(n).sum 
end 

def perfect_number? (n)
    return n == aliquot_sum(n)
end 

def ideal_numbers (n)
    arr = []
    i = 1
    while arr.length < n 
        arr << i if perfect_number?(i)
        i += 1
    end 
    return arr 
end 