def partition(arr, n)
    ans = [[],[]]
    arr.each do |ele|
        if ele < n 
            ans[0] << ele
        else 
            ans[1] << ele 
        end 
    end 
    return ans 
end 

def merge(hash1, hash2)
    ans = {}
    hash1.each do |k, v|
        ans[k] = v
    end 
    hash2.each do |k, v|
        ans[k] = v
    end 
    return ans 
end 

def censor(str, arr)
    vowels = "aeiou"
    words = str.split(" ")
    new_words = words.map do |ele|
        if arr.include?(ele.downcase)
            ele.each_char.with_index do |char, i|
                if vowels.include?(char.downcase)
                    ele[i] = "*"
                end
            end 
        end 
        ele 
    end 
    return new_words.join(" ")
end 

def power_of_two?(n)
    if n < 0 
        return false 
    end 
    return true if n == 1 
    curr = 1
    while curr < n 
        curr *= 2 
        return true if curr == n 
    end 
    return false 
end 