require 'spec_helper'

describe ToyRobot::ToyRobot do
  let(:tabletop) { ToyRobot::Tabletop.new(5, 5) }

  subject { ToyRobot::ToyRobot.new(tabletop) }

  describe '#place' do

    let(:position) { ToyRobot::Position.new(1, 1) }

    before { tabletop.stubs(:place_robot).returns(position) }

    it 'places the robot at the specified position' do
      subject.place(position, :north)
      expect(subject.position).to eq position
    end

    it 'places the robot facing the specified direction' do
      subject.place(position, :north)
      expect(subject.facing_direction).to eq :north
    end
  end
end
