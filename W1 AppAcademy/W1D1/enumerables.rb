class Array
    def my_each (&block)
        i = 0
        while (i < self.length) 
            block.call(self[i])
            i += 1
        end 
        return self
    end

    def my_select (&block)
        new_arr = []
        self.my_each do |el|
            new_arr << el if block.call(el)
        end 
        return new_arr
    end

    def my_reject (&block)
        new_arr = []
        self.my_each do |el|
            new_arr << el if !block.call(el)
        end
        return new_arr
    end

    def my_any? (&block)
        self.my_each do |el|
            return true if block.call(el)
        end
        return false  
    end

    def my_flatten 
        new_arr = []
        self.my_each do |el|
            unless el.is_a?(Array) 
                new_arr << el
            else 
                new_arr += el.my_flatten  
            end 
        end 
        return new_arr
    end

    def my_zip(*arr)
        new_arr = Array.new(self.length){Array.new(arr.length + 1)}
        self.each_with_index do |el, i|
            new_arr[i][0] = el  
            arr.each_with_index do |el2, idx|
                new_arr[i][idx+1] = el2[i]
            end 
        end 
        new_arr
    end

    def my_rotate(amt = 1)
        if amt > 0
            amt.times do
                el = self.pop
                self.unshift(el)
            end
        else  
            amt.abs.times do 
                el = self.shift 
                self.push(el)
            end 
        end 
        self 
    end  
    
    def my_join(str = "")
        result = ""
        self.each.with_index do |char, i| 
           result << char 
           result << str if i != self.length - 1
        end 
        return result 
    end 

    def my_reverse 
        new_arr = [] 
        i = self.length - 1 
        while (i >= 0)
            new_arr << self[i]
            i -= 1 
        end 
        return new_arr
    end 

end 



