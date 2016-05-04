module ToyRobot
  class Tabletop

    def initialize(rows, columns)
      @rows = rows
      @columns = columns
    end

    def can_place?(position)
      position.row >= 0 && position.row < @rows &&
      position.column >= 0 && position.column < @columns
    end
  end
end
