# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    ans = ""
    prev = ""
    count = 1
    str.each_char.with_index do |char, i|
        if char == prev 
            count += 1
        else 
            ans << (count.to_s) if count != 1 
            ans << prev 
            prev = char 
            count = 1 
        end 
        if i == str.length - 1
            ans << (count.to_s) if count != 1
            ans << char 
        end 
    end 
    return ans
end 

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
