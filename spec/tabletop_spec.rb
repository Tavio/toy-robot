require 'spec_helper'

describe ToyRobot::Tabletop do
  let(:rows) { 5 }
  let(:columns) { 5 }
  
  subject { ToyRobot::Tabletop.new(rows, columns) }

  describe '#place_robot' do
    it "returns the robot's new position" do
      position = ToyRobot::Position.new(1, 1)
      expect(subject.place_robot(position)).to eq position
    end

    it "prevents the robot from being placed outside of the tabletop" do
      position = ToyRobot::Position.new(6, 5)
      expect(subject.place_robot(position)).to eq nil
    end
  end

end
