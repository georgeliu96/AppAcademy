require "Byebug"

def range(start, finish)
    return [] if finish <= start
    [start] if finish-start == 1
    [start] + range(start+1, finish)
end

def sum_rec(arr)
    return 0 if arr.length == 0
    return arr.first if arr.length == 1
    arr.first + sum_rec(arr.drop(1))
end

def sum_iter(arr)
    sum = 0
    arr.each do |el|
        sum += el
    end
    sum
end

def expo1(b,n)
    return 1 if n == 0
    b * expo1(b, n-1) 
end

def expo2(b,n)
    return 1 if n == 0
    return b if n == 1
    e = expo2(b,n/2)
    o = expo2(b, (n-1) / 2)
    n.even? ? e * e : b * o * o
end

class Array

    def deep_dup
        self.dup if self.none? {|ele| ele.is_a? Array}
        arr = []
        self.each do |ele| 
            if ele.is_a? Array
                arr << ele.deep_dup 
            else 
                arr << ele 
            end
        end
        return arr
    end

end 

def fib(n)
    return [0,1].take(n) if n <= 2
    prev = fib(n - 1)
    next_num = prev[-1] + prev[-2]
    return prev + [next_num] 
end

def bsearch(arr, target)
    return nil if arr.length == 0
    middle = arr.length/2
    return middle if arr[middle] == target
    if arr[middle] > target
        bsearch(arr[0...middle], target)
    else
        right_side = bsearch(arr[middle+1..-1],target)
        return nil if right_side == nil
        middle + right_side + 1
    end
end

def merge_sort(arr)

    return arr if arr.length <= 1
    left = arr[0...arr.length/2]
    right = arr[arr.length/2..-1]
    merge(merge_sort(left),merge_sort(right))
end

def merge(arr1, arr2)
    arr = []
    until arr1.length == 0 && arr2.length == 0 
        if arr2.length == 0 
            arr << arr1.shift 
        elsif arr1.length == 0 
            arr << arr2.shift 
        elsif arr1[0] < arr2[0]
            arr << arr1.shift 
        else 
            arr << arr2.shift 
        end
    end 
    return arr
end

def subsets(arr)
    # debugger
    # return [[],arr].take(arr.length + 1) if arr.length <= 1
    # debugger
    # return (subsets(arr[0..-2]) + subsets(arr[1..-1]) + [arr]).uniq

    return [[]] if arr.length == 0
    subs = subsets(arr.take(arr.length-1))
    new_subs = subs.map do |subarr|
        subarr += [arr[-1]]
    end
    return subs + new_subs 
end

def permutations(array)
    debugger
    return [array] if array.length <= 1
    answer_arr = []
    array.each_with_index do |el,i|
        perm = permutations(array[0...i] + array[i+1..-1])
        perm.each do |subs|
            answer_arr << [el] + subs
        end
    end
    answer_arr
end

def greedy_make_change (amt, arr)
    coins = []
    return coins if arr.length == 0
    big = amt / arr[0]
    big.times do 
        coins << arr[0]
        amt -= arr[0]
    end 
    coins += greedy_make_change(amt,arr[1..-1])
end 

def make_better_change(amt, arr)


    # ans = []
    # return (amt / arr[0]).times {ans << arr[0]} if arr.length == 1
    # greedy = greedy_make_change(amt,arr)
    # greedy_count = greedy.count{|coin| coin == greedy[0]} - 1
    # better = make_better_change(amt - (greedy.count) * greedy[0], arr[1..-1])
    # comp = greedy.take(greedy_count) + better 
    # ans = comp.length < greedy.length ? comp : greedy
    return [] if amt == 0
    return nil if arr.none? {|coin| amt >= coin}
    arr = arr.sort.reverse 
    
    best = nil
    arr.each_with_index do |coin, i|
        next if coin > amt 
        remainder = amt - coin
        new_better = make_better_change(remainder,arr.drop(i))
        next if new_better.nil? 
        potential_coins = [coin] + new_better 
        if best.nil? || (best.length > potential_coins.length) 
            best = potential_coins
        end 
    end 
    best
    # current_guess = make_better_change(amt - arr[0], arr)
    # potential_guess = make_better_change(amt - arr[0], arr[1..-1])
    # current_guess.length > potential_guess.length ? 
end 


