require 'byebug'

class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      resize! if count == num_buckets
      self.count += 1
      self[key] << key 
    end 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      self.count -= 1
    end 
    key
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    arr.each do |el|
      self.insert(el)
    end 
  end
end
