def my_reject (arr, &prc)
    return arr.select {|ele| !prc.call(ele)}
end 

def my_one? (arr, &prc)
    one = false
    arr.each do |ele|
        if !one && prc.call(ele)
            one = true 
        elsif prc.call(ele)
            return false 
        end 
    end 
    return one
end

def hash_select (hash, &prc)
    new_hash = {}

    hash.each do |k,v|
        new_hash[k] = v if prc.call(k,v)
    end 

    return new_hash 
end 

def xor_select (arr, prc1, prc2)
    return arr.select {|ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
end 

def proc_count(v, arr)
    count = 0

    arr.each {|prc| count += 1 if prc.call(v)}

    return count 
end 