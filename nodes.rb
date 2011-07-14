class Nodes
  
  attr_reader :nodes
  
  def initialize(nodes)
    @nodes = nodes
  end
  
  def <<(node)
    @nodes << node
    self
  end
end

class WalkNode
  def run
    puts "walking"
  end
end

class TurnNode
  
  attr_reader :direction
  
  def initialize(direction)
    @direction = direction
  end

end