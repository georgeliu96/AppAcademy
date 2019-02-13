class Array 

    def my_uniq 
        my_uniq_arr = []
        self.each do |ele| 
            if !(my_uniq_arr.include?(ele)) 
                my_uniq_arr << ele  
            end 
        end
        return my_uniq_arr 
    end

    def two_sum 
        two_sum_arr = [] 
        self.each.with_index do |ele1, i1| 
            self.each.with_index do |ele2, i2|
                two_sum_arr << [i1,i2] if ele1 + ele2 == 0 && i1 < i2 
            end 
        end
        return two_sum_arr
    end 

    def my_transpose 
        transposed_arr = [] 
        self.each.with_index do |row, i1| 
            sub_arr = []
            row.each.with_index do |ele, i2|
                sub_arr << self[i2][i1]
            end 
            transposed_arr << sub_arr
        end 
        return transposed_arr 
    end

    def stock_pick 
        stock_pick_hash = Hash.new{|h,k| h[k] = []}
        (0..(self.length - 1)).each do |start_idx|
            ((start_idx+1)..(self.length - 1)).each do |end_idx| 
                difference = self[end_idx] - self[start_idx]
                stock_pick_hash[difference] << [start_idx,end_idx]
            end 
        end 
        stocked = stock_pick_hash.sort_by{|k,v| k}
        return stocked[-1][1]
    end

end 