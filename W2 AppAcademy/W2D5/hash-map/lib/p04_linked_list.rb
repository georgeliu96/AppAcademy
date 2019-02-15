class Node
  attr_reader :key
  attr_accessor :val, :next, :prev


  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head, @tail = Node.new, Node.new
    @head.next, @tail.prev = @tail, @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  # def inspect 
  #   ans = []
  #   self.each do |node| 
  #     ans << [node.key, node.val]
  #   end
  #   return ans
  # end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node| 
      return node.val if node.key == key
    end 
    return nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end 
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    if empty?
      @head.next = node
      @tail.prev = node
      node.next, node.prev = @tail, @head 
    else 
      last.next = node 
      node.prev = last 
      node.next = @tail 
      @tail.prev = node 
    end 
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key 
    end
  end

  def remove(key)
    self.each do |node| 
      if node.key == key
        return remove_node(node)
      end 
    end 
  end

  def remove_node(node)
    node.prev.next, node.next.prev = node.next, node.prev
    return node
  end

  def each (&prc)
    node = first
    until node == @tail 
      prc.call(node)
      node = node.next
    end 
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
