require "toy_robot/version"
require 'tabletop.rb'
require 'position.rb'

module ToyRobot
  class ToyRobot

    attr_reader :position, :facing_direction

    def initialize(tabletop)
      @tabletop = tabletop
      @position = nil
      @facing_direction = nil
    end

    def place(position, facing_direction)
      if @tabletop.can_place?(position)
        @position = position
        @facing_direction = facing_direction
      end
    end

    def left
      case @facing_direction
      when :south
        @facing_direction = :east
      end
    end
  end
end
