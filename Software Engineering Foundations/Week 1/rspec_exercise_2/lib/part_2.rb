def palindrome?(str)
    i = 0
    while i < (str.length / 2) 
        return false if str[i] != str[(-1 - i)]
        i += 1
    end 
    return true
end

def substrings(str)
    ans = []
    ans << str[0]
    return ans if str.length == 1 
    curr = 1
    (str.length - 1).times do 
        ans << ans[-1] + str[curr]
        curr += 1
    end 
    return ans + substrings(str[1..-1]) 
end 

def palindrome_substrings(str)
    substrings(str).select {|sub| palindrome?(sub) && sub.length > 1}
end