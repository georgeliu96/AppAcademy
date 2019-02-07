def reverser(str, &prc)
    return prc.call(str.reverse)
end 

def word_changer(str, &prc)
    return (str.split(" ").map {|ele| prc.call(ele)}).join(" ")
end 

def greater_proc_value (n, prc1, prc2)
    return [prc1.call(n), prc2.call(n)].max
end

def and_selector (arr, prc1, prc2)
    return arr.select {|ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper (arr, prc1, prc2)
    return arr.map.with_index do |ele, i|
        if i % 2 == 0
            prc1.call(ele)
        else
            prc2.call(ele)
        end 
    end 
end 