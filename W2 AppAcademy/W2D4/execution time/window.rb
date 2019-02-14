def windowed_max_range(arr,w)
    current_max = nil
    i = 0
    j = w - 1
    while j < arr.length 
        mini = arr[i..j].min
        maxi = arr[i..j].max
        range = maxi - mini
        current_max = range if current_max.nil? || range > current_max 
        i += 1 
        j += 1
    end 
    return current_max
end


windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8