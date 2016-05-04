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
      @position = @tabletop.place_robot(position)
      @facing_direction = facing_direction
    end
  end
end
