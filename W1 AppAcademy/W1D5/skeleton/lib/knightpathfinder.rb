require_relative '00_tree_node'
require "queue"

class KnightPathFinder
    
    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree(@root_node)
    end

    #still need to change it to build the whole tree
    def build_move_tree(root_node)
        start_pos = root_node.value
        queue = Queue.new 
        new_move_positions(start_pos).each do  | move |
            move_node = PolyTreeNode.new(move)
            root_node.add_child(move_node)
        end
    end

    def find_path(end_pos)
        found_node = root_node.bfs(end_pos)
        while found_node.nil? 
            root_node.children.each do |child|
                found_node = child.bfs(end_pos)
                return trace_path_back(found_node) unless found_node.nil?
                build_move_tree(child)
            end 
        end 
        return trace_path_back(found_node)
    end

    def trace_path_back(found_node)
        curr_node = found_node 
        path = []
        until curr_node.parent.nil?
            path.unshift(curr_node.value) 
            curr_node = curr_node.parent 
        end 
        path.unshift(curr_node.value)
        return path
    end

    def new_move_positions(pos)
        new_move = KnightPathFinder.valid_moves(pos)
        #debugger
        valid_moves = new_move.reject { | move | @considered_positions.include?(move) }
        @considered_positions += valid_moves
        return valid_moves
    end

    def self.valid_moves(pos)
        valid_moves = [] 
        row, col = pos 
        # new_r1, new_c1 = row + 2, col + 1
        # new_r2, new_c2 = row + 1, col + 2
        (1..4).each do |num| 

            case num
            when 1 #add 2 to row, add+sub 1 to col
                valid_moves << [row+2, col-1]
                valid_moves << [row+2, col+1]
            when 2
                valid_moves << [row+1, col-2]
                valid_moves << [row+1, col+2]
            when 3
                valid_moves << [row-2, col-1]
                valid_moves << [row-2, col+1]
            when 4
                valid_moves << [row-1, col-2]
                valid_moves << [row-1, col+2]
            # if num.even? 
            #     valid_moves << [new_r1 *= - 1, new_c1]
            #     valid_moves << [new_r2 *= - 1, new_c2]
            # else
            #     valid_moves << [new_r1, new_c1 *= -1]
            #     valid_moves << [new_r2, new_c2 *= -1]
            # end
            end
        end

        return KnightPathFinder.valid_position(valid_moves)
    end
    
    def self.valid_position(valid_moves)
        valid_moves.select do | move |
            (1..8).to_a.include?(move[0]) &&
            (1..8).to_a.include?(move[1])
        end
    end

    
end

play = KnightPathFinder.new([1, 1])
print play.find_path([4,7])
puts