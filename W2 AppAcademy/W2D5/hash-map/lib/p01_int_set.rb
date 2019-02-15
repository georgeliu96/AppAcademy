require "byebug"
class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    validate!(num)
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    store[num] = false
  end

  def include?(num)
    raise "Out of bounds" unless is_valid?(num)
    return store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < max
  end

  def validate!(num)
    @store[num] = true
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      resize! if count == num_buckets
      self.count += 1
      self[num] << num 
    end 
  end

  def remove(num)
    if self.include?(num)
      self.count -= 1
      self[num].delete(num)
    end
    num
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_writer :count 

  def [](num)
      @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!   
    # debugger
    removed = []
    @store.each do |arr|
      arr.each do |el|
        removed << remove(el)
      end 
    end
    @store.concat(Array.new(num_buckets) {Array.new})
    removed.each do |el| 
      insert(el)
    end
  end
end
