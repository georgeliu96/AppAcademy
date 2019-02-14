#phase 1
def my_min(arr)
    arr.each_with_index do |num1,i| 
        return num1 if (arr[0...i]+arr[i+1..-1]).all? do |num2| 
            num1 < num2
        end
    end
end
#phase 2
def my_min(arr)
    count = arr[0]
    arr.each{|num| count = num if num < count}
    count
end

#phase1
def largest_contiguous_subsum(arr)
    subs = []

    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            if i2 >= i1
                subs << arr[i1..i2]
            end
        end
    end
    max = subs[0].sum
    subs[1..-1].each do |num1|
        max = num1.sum if max < num1.sum
    end
    max
end

#phaseII
#list = [2, 3, -6, 7, -6, 7]
 

def largest_contiguous_subsum(arr)
    return arr.max if arr.all?{|num| num < 0}
    newSum = 0
    sum = 0

    arr.each do |num|
        newSum += num
        
        if newSum < 0
            newSum = 0
        end
        sum = newSum if newSum > sum
    end
    sum
end