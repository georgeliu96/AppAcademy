def first_anagram?(str1,str2)
    anags = all_anagram(str1)
    anags.include?(str2)
end

def all_anagram(str)
    new_str_arr = str.split("").permutation.to_a
    new_str_arr.map{|word| word.join}
    # anas = []
    # inds = (0..str.length-1).to_a
    # ind_arr = inds.permutations(str.length).to_a 
    # ind_arr.each do |sub| 
    #     ana = ""
    #     sub.each do |i| 
    #         ana += str[i]
    #     end 
    #     anas << ana 
    # end 
    # return ans
end

def second_anagram?(str1, str2)
    return false if str1.length != str2.length
    str2 = str2.split("")
    str1.each_char do |char|
        if str2.include?(char)
            str2.delete_at(str2.index(char))
        end 
    end 
    return str2.length == 0
end

def third_anagram?(str1,str2)
    arr1, arr2 = str1.split(""), str2.split("")
    arr1, arr2 = arr1.sort, arr2.sort
    return arr1.join("") == arr2.join("")
end

def fourth_anagram? (str1,str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}
    return hash1 == hash2    
end 

def bonus_anagram? (str1,str2)
    hash = Hash.new{|h,k| h[k] = Array.new(2){0}}
    str1.each_char do |char| 
        hash[char][0] += 1
    end 
    str2.each_char do |char| 
        hash[char][1] += 1 
    end 
    hash.all? {|k,v| v[0] == v[1]}
end
