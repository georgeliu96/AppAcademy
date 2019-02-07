$vowels = "aeiou"
$alphabet = "abcdefghijklmnopqrstuvwxyz"

def hipsterfy(word)
    word.reverse.each_char.with_index do |char, i|
        return (word.reverse[0...i] + word.reverse[(i + 1)..-1]).reverse if $vowels.include?(char)
    end 
    return word 
end  

def vowel_counts(str)
    ans = Hash.new(0)
    str.each_char do |char|
        if $vowels.include?(char.downcase)
            ans[char.downcase] += 1
        end 
    end 
    return ans
end 

def caesar_cipher(str, n)
    ans = ""
    str.each_char do |char|
        if $alphabet.include?(char)
            ans << $alphabet[($alphabet.index(char) + n) % 26]         
        else 
            ans << char 
        end 
    end 
    return ans 
end 