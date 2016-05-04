require "toy_robot/version"
require 'tabletop.rb'
require 'position.rb'
require 'direction.rb'

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
      @facing_direction = @facing_direction.left
    end

    def right
      @facing_direction = @facing_direction.right
    end

    def move
      place(@facing_direction.move(@position), @facing_direction)
    end

  end
end
