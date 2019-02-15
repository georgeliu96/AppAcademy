require_relative 'p05_hash_map'
require_relative 'p04_linked_list'



class LRUCache

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
  
    if @map.include?(key)
      node = @store.remove(key)
      @store.append(node.key, node.val)
      return node.val 
    else
      val = @prc.call(key)
      @store.append(key,val)
      @map.set(key,val)
      if count > @max 
        eject!  
      end 
      return val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  # suggested helper method; move a node to the end of the list
  def update_node!(node)
    # key, val = node
    # @store.append(key, val)
  end

  def eject!
    @store.remove(@store.first.key)
  end
end
