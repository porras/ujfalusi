module Runtime
  
  class Runner
    
    NORTH = [ 0, -1]
    SOUTH = [ 0,  1]
    EAST  = [ 1,  0]
    WEST  = [-1,  0]
    
    def initialize
      @position = [10, 10]
      @direction = EAST
      @path = [@position]
    end
    
    def step(node)
      case node
      when WalkNode
        @position = [@position[0] + @direction[0], @position[1] + @direction[1]]
        @path     << @position
      when TurnNode
        @direction = turn(@direction, node.direction)
      end
    end
    
    def draw
      field = Field.new
      @path.each do |point|
        field << point
      end
      field.draw
    end
    
    private
    
    def turn(current_direction, turn_direction)
      case [current_direction, turn_direction]
      when [NORTH, 'right']: EAST
      when [EAST,  'right']: SOUTH
      when [SOUTH, 'right']: WEST
      when [WEST,  'right']: NORTH
      when [WEST,  'left' ]: SOUTH
      when [SOUTH, 'left' ]: EAST
      when [EAST,  'left' ]: NORTH
      when [NORTH, 'left' ]: WEST
      end
    end
    
  end
  
  class Field
    def initialize
      @rows = (1..20).map do |i|
        (1..20).map do |j|
          "·"
        end
      end
    end
    
    def <<(point)
      @rows[point[1]][point[0]] = "X"
    end
    
    def draw
      @rows.map do |row|
        row.join
      end.join("\n")
    end
  end
  
  class << self
    
    def run(nodes)
      runner = Runner.new
      nodes.each do |node|
        runner.step(node)
      end
      runner.draw
    end
    
  end
  
end