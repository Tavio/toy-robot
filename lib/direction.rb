module ToyRobot
  class Direction
  
    def initialize(position_increment)
      @position_increment = position_increment
    end

    EAST = Direction.new(Position.new(0, 1))
    NORTH = Direction.new(Position.new(-1, 0))
    WEST = Direction.new(Position.new(0, -1))
    SOUTH = Direction.new(Position.new(1, 0))

    DIRECTIONS = [ EAST, SOUTH, WEST, NORTH ]

    def right
      DIRECTIONS[(DIRECTIONS.index(self) + 1) % DIRECTIONS.size]
    end

    def left
      DIRECTIONS[(DIRECTIONS.index(self) - 1 + DIRECTIONS.size) % DIRECTIONS.size]
    end

    def move(position)
      position + @position_increment
    end

  end
end
