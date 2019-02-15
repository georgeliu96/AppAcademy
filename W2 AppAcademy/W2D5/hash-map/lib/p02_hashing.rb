class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return -1 if self.empty?
    return self.join("").to_i
  end
end

class String
  def hash
    alpahabet = ("a".."z").to_a
    arr = self.split("")
    arr.map! do |ele|
      alpahabet.index(ele) 
    end
    arr.join("").to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    base_hash = self.sort
    base_hash.each.with_index do |array, i| 
      array.map! {|el| el.to_s}
      base_hash[i] = array.join("").hash
    end
    return base_hash.join("").to_i
  end
end
