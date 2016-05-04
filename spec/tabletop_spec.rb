require 'spec_helper'

describe ToyRobot::Tabletop do
  let(:rows) { 5 }
  let(:columns) { 5 }
  
  subject { ToyRobot::Tabletop.new(rows, columns) }

  describe '#robot_position' do
    context 'when the robot has not yet been placed' do
      it 'returns nil' do
        expect(subject.robot_position).to be_nil 
      end
    end

    it "returns the robot's current position on the tabletop" do
      position = ToyRobot::Position.new(1,1)
      subject.place_robot(position)
      expect(subject.robot_position).to eq(position) 
    end
  end

end
