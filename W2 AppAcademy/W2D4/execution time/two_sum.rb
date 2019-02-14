def bad_two_sum? (arr, target)
    arr.each.with_index do |el1, i1| 
        arr.each.with_index do |el2, i2| 
            return true if el1 + el2 == target && i2 > i1 
        end 
    end 
    return false 
end

def okay_two_sum? (arr,target)
    arr = arr.sort
    arr.each.with_index do |num, i|
        return true if bsearch((arr[0...i] + arr[i1+1..-1]),target - num)
    end
    return false 
end

def bsearch(nums, target)
  # nil if not found; can't find anything in an empty array
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    # search in left
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index # found it!
  when 1
    # search in the right; don't forget that the right subarray starts
    # at `probe_index + 1`, so we need to offset by that amount.
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
  end

  # Note that the array size is always decreasing through each
  # recursive call, so we'll either find the item, or eventually end
  # up with an empty array.
end

def two_sum? (arr, target)
    hash = Hash.new(0)
    arr.each do |num|
        hash[num] += 1 
    end
    hash.each do |k,v|
        if hash[target - k] > 0 
            return true 
        end 
    end 
    return false 
end 
