module ToyRobot
  class Tabletop

    attr_reader :robot_position

    def initialize(rows, columns)
      @rows = rows
      @columns = columns
      @robot_position = nil
    end

    def place_robot(position)
      @robot_position = position
    end
  end
end
