class GraphNode
    attr_accessor :neighbors
    attr_reader :value
    def initialize(value)
        @value = value
        @neighbors = []
    end
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

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []
    while !queue.empty?
        temp = queue.shift
        while !visited.include?(temp)
            return temp.value if temp.value == target_value
            queue += temp.neighbors
            visited << temp
        end
    end
    return nil
end

p bfs(a, "b")
p bfs(a, "f")
