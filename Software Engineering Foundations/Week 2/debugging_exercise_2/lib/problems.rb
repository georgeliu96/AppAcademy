# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(n)
    n.downto(2).each do |num|
        return num if (n % num == 0 && is_prime?(num))
    end 
end 

def is_prime?(num)
    if num < 2 
        return false 
    end 

    (2...num).each do |n|
        return false if (num % n == 0)
    end 

    return true 
end 

def unique_chars?(str)
    chars = str.split("")
    return chars == chars.uniq
end 

def dupe_indices(arr)
    count = Hash.new{|h,k| h[k] = []}
    arr.each.with_index do |ele, i|
        count[ele] << i
    end 
    return count.select{|k,v| v.length >= 2}
end

def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)
    arr1.each {|x| count1[x] += 1}
    arr2.each {|y| count2[y] += 1}
    return count1 == count2
end