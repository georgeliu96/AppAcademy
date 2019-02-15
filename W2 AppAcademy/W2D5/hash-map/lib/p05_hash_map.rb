require "byebug"
require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    if self.include?(key)
      @store[key.hash % num_buckets].update(key,val)
    else 
      resize! if count == num_buckets
      @store[key.hash % num_buckets].append(key,val)
      self.count += 1
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash % num_buckets].remove(key)
    self.count -= 1 
  end

  def each(&prc)
    @store.each do |list|
      list.each do |node|
        prc.call(node.key,node.val)
      end 
    end 
    @store
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    #doing it with a new array 
    # new_store = Array.new(num_buckets * 2) { LinkedList.new }
    # @count = 0
    # result = []
    # self.each do |k,v| 
    #   result << [k,v] 
    # end 
    # result.each do |node|
    #   key, val = node 
    #   new_store[key.hash % (num_buckets * 2)].append(key,val)
    #   self.count += 1
    # end 
    # @store = new_store

    #doing it with a new HashMap
    new_map = HashMap.new(num_buckets * 2)
    self.each do |key,val|
      new_map.set(key,val)
    end
    @store = new_map.store

  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end

  protected 
  attr_accessor :store 
end
