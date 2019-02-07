def average(num1, num2)
    return (num1 + num2) / 2.0 if ((num1 + num2) % 2 != 0)
    (num1 + num2) / 2
end 

def average_array(arr)
    return arr.inject(:+) / arr.length.to_f if (arr.inject(:+) % arr.length != 0)
    arr.inject(:+) / arr.length
end 

def repeat (str, num)
    str * num
end 

def yell (str)
    str.upcase + "!"
end 

def alternating_case (str)
    words = str.split(" ")
    ans = []
    i = 0
    while i < words.length
        ans << words[i].upcase
        ans << words[i + 1].downcase
        i += 2
    end 
    return ans.join(" ")
end 