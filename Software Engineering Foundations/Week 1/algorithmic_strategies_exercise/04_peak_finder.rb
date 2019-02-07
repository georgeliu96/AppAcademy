# Write a method, peak_finer(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr) 
    ans = []
    ans << arr[0] if arr[0] > arr[1]
    arr[1...-1].each_with_index do |num, i| 
        ans << num if arr[i] < arr[i + 1] && arr [i + 1] > arr[i + 2]
    end 
    ans << arr[-1] if arr[-1] > arr[-2]
    return ans
end 

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
