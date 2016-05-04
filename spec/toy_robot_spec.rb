require 'spec_helper'

describe ToyRobot::ToyRobot do
  let(:tabletop) { ToyRobot::Tabletop.new(5, 5) }

  subject { ToyRobot::ToyRobot.new(tabletop) }

  describe '#place' do
    let(:position) { ToyRobot::Position.new(1, 1) }

    context 'when specified position is valid' do
      before { tabletop.stubs(:can_place?).returns(true) }

      it 'places the robot at the specified position' do
        subject.place(position, ToyRobot::Direction::NORTH)
        expect(subject.position).to eq position
      end

      it 'places the robot facing the specified direction' do
        subject.place(position, ToyRobot::Direction::NORTH)
        expect(subject.facing_direction).to eq ToyRobot::Direction::NORTH
      end
    end

    context 'when specified position is invalid' do
      before { tabletop.stubs(:can_place?).returns(false) }

      it "does not change the robot's current position" do
        subject.place(position, ToyRobot::Direction::NORTH)
        expect(subject.position).to eq nil 
      end

      it "does not change the robot's current facing direction" do
        subject.place(position, ToyRobot::Direction::NORTH)
        expect(subject.facing_direction).to eq nil
      end
    end
  end

  describe '#left' do
    it "changes the robot's facing direction from south to east" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::SOUTH)
      subject.left
      expect(subject.facing_direction).to eq ToyRobot::Direction::EAST
    end

    it "changes the robot's facing direction from east to north" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::EAST)
      subject.left
      expect(subject.facing_direction).to eq ToyRobot::Direction::NORTH
    end

    it "changes the robot's facing direction from north to west" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::NORTH)
      subject.left
      expect(subject.facing_direction).to eq ToyRobot::Direction::WEST
    end

    it "changes the robot's facing direction from west to south" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::WEST)
      subject.left
      expect(subject.facing_direction).to eq ToyRobot::Direction::SOUTH
    end
  end

  describe '#right' do
    it "changes the robot's facing direction from south to west" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::SOUTH)
      subject.right
      expect(subject.facing_direction).to eq ToyRobot::Direction::WEST
    end

    it "changes the robot's facing direction from west to north" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::WEST)
      subject.right
      expect(subject.facing_direction).to eq ToyRobot::Direction::NORTH
    end

    it "changes the robot's facing direction from north to east" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::NORTH)
      subject.right
      expect(subject.facing_direction).to eq ToyRobot::Direction::EAST
    end

    it "changes the robot's facing direction from east to south" do
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::EAST)
      subject.right
      expect(subject.facing_direction).to eq ToyRobot::Direction::SOUTH
    end
  end

  describe '#move' do

    before { tabletop.stubs(:can_place?).returns true }

    it 'moves south' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::SOUTH)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(4, 3)
    end

    it 'moves east' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::EAST)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(3, 4)
    end

    it 'moves north' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::NORTH)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(2, 3)
    end

    it 'moves west' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, ToyRobot::Direction::WEST)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(3, 2)
    end 
  end
end
