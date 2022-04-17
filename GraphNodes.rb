require "set"

class Graphnode
    #  should give us access to its value and the nodes to which it connects us
    attr_accessor :val, :neighbors
    def initialize(val)
        self.val = val
        self.neighbors = []
    end
    # For any given node, we should be able to add a neighboring node.
    def add_neighbor(node)
        self.neighbors << node
    end
end

def bfs(starting_node, target)
    # keep track not just of the queue
    queue = [starting_node]
    # but also of all the nodes we've visited so far
    visited = Set.new()

    until queue.empty? #searching que
        node = queue.shift #movement to next node if not found
        unless visited.include?(node) 
            # If you find the target_value, return the node with that value
            return node.val if node.val == target_value
            visited.add(node) #adds element to set
            queue += node.neighbors
        end
    end
    # If no node is found with the target_value, return nil.
    nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]