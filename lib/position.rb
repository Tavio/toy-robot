module ToyRobot
  class Position
    attr_reader :row, :column

    def initialize(row, column)
      @row = row
      @column = column
    end

    def +(another_position)
      Position.new(row + another_position.row, column + another_position.column)
    end

    def ==(another_position)
      @row == another_position.row && @column == another_position.column
    end
  end
end
