require 'spec_helper'

describe ToyRobot::ToyRobot do
  let(:tabletop) { ToyRobot::Tabletop.new(5, 5) }

  subject { ToyRobot::ToyRobot.new(tabletop) }

  describe '#place' do
    let(:position) { ToyRobot::Position.new(1, 1) }

    context 'when specified position is valid' do
      before { tabletop.stubs(:can_place?).returns(true) }

      it 'places the robot at the specified position' do
        subject.place(position, :north)
        expect(subject.position).to eq position
      end

      it 'places the robot facing the specified direction' do
        subject.place(position, :north)
        expect(subject.facing_direction).to eq :north
      end
    end

    context 'when specified position is invalid' do
      before { tabletop.stubs(:can_place?).returns(false) }

      it "does not change the robot's current position" do
        subject.place(position, :north)
        expect(subject.position).to eq nil 
      end

      it "does not change the robot's current facing direction" do
        subject.place(position, :north)
        expect(subject.facing_direction).to eq nil
      end
    end
  end

  describe '#left' do
    it "changes the robot's facing direction from south to east" do
      subject.instance_variable_set(:@facing_direction, :south)
      subject.left
      expect(subject.facing_direction).to eq :east
    end

    it "changes the robot's facing direction from east to north" do
      subject.instance_variable_set(:@facing_direction, :east)
      subject.left
      expect(subject.facing_direction).to eq :north
    end

    it "changes the robot's facing direction from north to west" do
      subject.instance_variable_set(:@facing_direction, :north)
      subject.left
      expect(subject.facing_direction).to eq :west
    end

    it "changes the robot's facing direction from west to south" do
      subject.instance_variable_set(:@facing_direction, :west)
      subject.left
      expect(subject.facing_direction).to eq :south
    end
  end

  describe '#right' do
    it "changes the robot's facing direction from south to west" do
      subject.instance_variable_set(:@facing_direction, :south)
      subject.right
      expect(subject.facing_direction).to eq :west
    end

    it "changes the robot's facing direction from west to north" do
      subject.instance_variable_set(:@facing_direction, :west)
      subject.right
      expect(subject.facing_direction).to eq :north
    end

    it "changes the robot's facing direction from north to east" do
      subject.instance_variable_set(:@facing_direction, :north)
      subject.right
      expect(subject.facing_direction).to eq :east
    end

    it "changes the robot's facing direction from east to south" do
      subject.instance_variable_set(:@facing_direction, :east)
      subject.right
      expect(subject.facing_direction).to eq :south
    end
  end

  describe '#move' do

    before { tabletop.stubs(:can_place?).returns true }

    it 'moves south' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, :south)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(4, 3)
    end

    it 'moves east' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, :east)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(3, 4)
    end

    it 'moves north' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, :north)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(2, 3)
    end

    it 'moves west' do
      subject.instance_variable_set(:@position, ToyRobot::Position.new(3, 3))
      subject.instance_variable_set(:@facing_direction, :west)
      subject.move
      expect(subject.position).to eq ToyRobot::Position.new(3, 2)
    end 
  end
end
