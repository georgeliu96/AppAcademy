def select_even_nums (arr)
    arr.select(&:even?)
end 

def reject_puppies(arr)
    arr.reject{|i| i["age"] <= 2}
end 

def count_positive_subarrays(arr)
    arr.count{|sub| sub.sum > 0} 
end 

def aba_translate(str)
    new_word = ""
    str.each_char do |char|
        if "aeiou".include?(char)
            new_word << char + "b" + char 
        else 
            new_word << char 
        end 
    end 
    return new_word 
end 

def aba_array(arr)
    arr.map{|word| aba_translate(word)}
end 
