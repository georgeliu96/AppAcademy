require "Byebug"
require_relative "queue"

class PolyTreeNode

    attr_reader :value, :parent, :children

    def inspect
        @value.inspect 
    end

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end 

    def parent= (node)
        return @parent = nil if node.nil?
        if @parent.nil? 
            @parent = node
        else 
            self.parent.children.delete(self)
            @parent = node 
        end        
        node.children << self unless node.children.include?(self)
    end

    def add_child (node)
        node.parent = self
    end 

    def remove_child(node)
        node.parent = nil 
        raise unless self.children.include?(node)
    end

    def dfs(target)
        return self if self.value == target
        
        children.each do | child |       
            # debugger  
            child_inst = child.dfs(target)
            next if child_inst.nil?
            return child_inst if child_inst.value == target
        end

        nil
    end

    def bfs(target)
        queue = Queue.new
        queue.enqueue(self)
        until queue.show == nil
            node = queue.dequeue
            return node if node.value == target
            node.children.each { | child | queue.enqueue(child) }
        end
        nil
    end
end