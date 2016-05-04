module ToyRobot
  class Tabletop

    attr_reader :robot_position

    def initialize(rows, columns)
      @rows = rows
      @columns = columns
      @robot_position = nil
    end

    def place_robot(position)
      @robot_position = position if is_inside_table?(position)
      @robot_position
    end

    private

    def is_inside_table?(position)
      position.row >= 0 && position.row < @rows &&
      position.column >= 0 && position.column < @columns
    end
  end
end
